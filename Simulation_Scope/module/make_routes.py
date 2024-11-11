import pandas as pd
import random
from functools import reduce


def get_capacity(df: pd.DataFrame, id: int):
    capacity = dict()
    net = df.loc[id]
    for i in range(1, 5):
        capacity[i] = net[f'{i}r'] * 1800 + net[f'{i}S'] * 2000 + net[f'{i}r'] * 1800

    return capacity * 0.2


def get_n_scenarios(df: pd.DataFrame, id: int, n: int):
    columns = df.columns.copy()
    # columns.([f'{in_road}_{out_road}' for in_road in range(1, 5) for out_road in range(1, 5)])
    df_scen = pd.DataFrame(columns=columns)

    for i in range(n):
        new_scen = df.loc[id].copy()

        for road in range(1, 5):
            for direction in ['r', 's', 'l']:
                if direction == 'r':
                    next_road = road + 3
                    ratio = 1800 * 0.2
                elif direction == 's':
                    next_road = road + 2
                    ratio = 2000 * 0.2
                elif direction == 'l':
                    next_road = road + 1
                    ratio = 1800 * 0.2
                else:
                    print('Invalid direction!')
                    exit()

                if next_road > 4:
                    next_road -= 4

                capacity = df.loc[id][f'{road}{direction}'] * ratio
                new_scen[f'{road}_{next_road}'] = random.randint(int(0.1 * capacity), int(0.9 * capacity))

        df_scen = df_scen.append(new_scen, ignore_index=True)

    return df_scen


def make_scenarios(df: pd.DataFrame):
    n = 100

    dfs = list()

    for i in range(len(df)):

        if i % 10 == 0:
            print(f'{i}-th iteration...')

        dfs.append(get_n_scenarios(df, i, n))

    df_result = pd.concat(dfs, axis=0)
    df_result.reset_index(inplace=True, drop=True)
    df_result.to_csv('../scenarios.csv')


if __name__ == '__main__':
    df = pd.read_csv('../network.csv', index_col=0)
    make_scenarios(df)