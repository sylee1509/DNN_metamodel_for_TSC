Ô
ÜŤ
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
9
	IdentityN

input2T
output2T"
T
list(type)(0
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	

MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( 
?
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
Á
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ¨
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 "serve*2.11.02v2.11.0-rc2-15-g6290819256d8
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
~
Adam/v/dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/v/dense_3/bias
w
'Adam/v/dense_3/bias/Read/ReadVariableOpReadVariableOpAdam/v/dense_3/bias*
_output_shapes
:*
dtype0
~
Adam/m/dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/m/dense_3/bias
w
'Adam/m/dense_3/bias/Read/ReadVariableOpReadVariableOpAdam/m/dense_3/bias*
_output_shapes
:*
dtype0

Adam/v/dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*&
shared_nameAdam/v/dense_3/kernel

)Adam/v/dense_3/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense_3/kernel*
_output_shapes

:@*
dtype0

Adam/m/dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*&
shared_nameAdam/m/dense_3/kernel

)Adam/m/dense_3/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense_3/kernel*
_output_shapes

:@*
dtype0
~
Adam/v/dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/v/dense_2/bias
w
'Adam/v/dense_2/bias/Read/ReadVariableOpReadVariableOpAdam/v/dense_2/bias*
_output_shapes
:@*
dtype0
~
Adam/m/dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/m/dense_2/bias
w
'Adam/m/dense_2/bias/Read/ReadVariableOpReadVariableOpAdam/m/dense_2/bias*
_output_shapes
:@*
dtype0

Adam/v/dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*&
shared_nameAdam/v/dense_2/kernel

)Adam/v/dense_2/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense_2/kernel*
_output_shapes
:	@*
dtype0

Adam/m/dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*&
shared_nameAdam/m/dense_2/kernel

)Adam/m/dense_2/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense_2/kernel*
_output_shapes
:	@*
dtype0

Adam/v/dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/v/dense_1/bias
x
'Adam/v/dense_1/bias/Read/ReadVariableOpReadVariableOpAdam/v/dense_1/bias*
_output_shapes	
:*
dtype0

Adam/m/dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/m/dense_1/bias
x
'Adam/m/dense_1/bias/Read/ReadVariableOpReadVariableOpAdam/m/dense_1/bias*
_output_shapes	
:*
dtype0

Adam/v/dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*&
shared_nameAdam/v/dense_1/kernel

)Adam/v/dense_1/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense_1/kernel* 
_output_shapes
:
*
dtype0

Adam/m/dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*&
shared_nameAdam/m/dense_1/kernel

)Adam/m/dense_1/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense_1/kernel* 
_output_shapes
:
*
dtype0
{
Adam/v/dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_nameAdam/v/dense/bias
t
%Adam/v/dense/bias/Read/ReadVariableOpReadVariableOpAdam/v/dense/bias*
_output_shapes	
:*
dtype0
{
Adam/m/dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_nameAdam/m/dense/bias
t
%Adam/m/dense/bias/Read/ReadVariableOpReadVariableOpAdam/m/dense/bias*
_output_shapes	
:*
dtype0

Adam/v/dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*$
shared_nameAdam/v/dense/kernel
}
'Adam/v/dense/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense/kernel* 
_output_shapes
:
*
dtype0

Adam/m/dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*$
shared_nameAdam/m/dense/kernel
}
'Adam/m/dense/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense/kernel* 
_output_shapes
:
*
dtype0
n
learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namelearning_rate
g
!learning_rate/Read/ReadVariableOpReadVariableOplearning_rate*
_output_shapes
: *
dtype0
f
	iterationVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	iteration
_
iteration/Read/ReadVariableOpReadVariableOp	iteration*
_output_shapes
: *
dtype0	
p
dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_3/bias
i
 dense_3/bias/Read/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes
:*
dtype0
x
dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*
shared_namedense_3/kernel
q
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes

:@*
dtype0
p
dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namedense_2/bias
i
 dense_2/bias/Read/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes
:@*
dtype0
y
dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*
shared_namedense_2/kernel
r
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel*
_output_shapes
:	@*
dtype0
q
dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_1/bias
j
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes	
:*
dtype0
z
dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*
shared_namedense_1/kernel
s
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel* 
_output_shapes
:
*
dtype0
m

dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_name
dense/bias
f
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes	
:*
dtype0
v
dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*
shared_namedense/kernel
o
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel* 
_output_shapes
:
*
dtype0
|
serving_default_input_1Placeholder*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
dtype0*
shape:˙˙˙˙˙˙˙˙˙
ˇ
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1dense/kernel
dense/biasdense_1/kerneldense_1/biasdense_2/kerneldense_2/biasdense_3/kerneldense_3/bias*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *.
f)R'
%__inference_signature_wrapper_3378712

NoOpNoOp
ĺ2
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0* 2
value2B2 B2
ő
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer_with_weights-2
layer-3
layer_with_weights-3
layer-4
	variables
trainable_variables
regularization_losses
		keras_api

__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
* 
Ś
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias*
Ś
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias*
Ś
	variables
 trainable_variables
!regularization_losses
"	keras_api
#__call__
*$&call_and_return_all_conditional_losses

%kernel
&bias*
Ś
'	variables
(trainable_variables
)regularization_losses
*	keras_api
+__call__
*,&call_and_return_all_conditional_losses

-kernel
.bias*
<
0
1
2
3
%4
&5
-6
.7*
<
0
1
2
3
%4
&5
-6
.7*
* 
°
/non_trainable_variables

0layers
1metrics
2layer_regularization_losses
3layer_metrics
	variables
trainable_variables
regularization_losses

__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
4trace_0
5trace_1
6trace_2
7trace_3* 
6
8trace_0
9trace_1
:trace_2
;trace_3* 
* 

<
_variables
=_iterations
>_learning_rate
?_index_dict
@
_momentums
A_velocities
B_update_step_xla*

Cserving_default* 

0
1*

0
1*
* 

Dnon_trainable_variables

Elayers
Fmetrics
Glayer_regularization_losses
Hlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Itrace_0* 

Jtrace_0* 
\V
VARIABLE_VALUEdense/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
XR
VARIABLE_VALUE
dense/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*

0
1*

0
1*
* 

Knon_trainable_variables

Llayers
Mmetrics
Nlayer_regularization_losses
Olayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Ptrace_0* 

Qtrace_0* 
^X
VARIABLE_VALUEdense_1/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_1/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*

%0
&1*

%0
&1*
* 

Rnon_trainable_variables

Slayers
Tmetrics
Ulayer_regularization_losses
Vlayer_metrics
	variables
 trainable_variables
!regularization_losses
#__call__
*$&call_and_return_all_conditional_losses
&$"call_and_return_conditional_losses*

Wtrace_0* 

Xtrace_0* 
^X
VARIABLE_VALUEdense_2/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_2/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*

-0
.1*

-0
.1*
* 

Ynon_trainable_variables

Zlayers
[metrics
\layer_regularization_losses
]layer_metrics
'	variables
(trainable_variables
)regularization_losses
+__call__
*,&call_and_return_all_conditional_losses
&,"call_and_return_conditional_losses*

^trace_0* 

_trace_0* 
^X
VARIABLE_VALUEdense_3/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_3/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
'
0
1
2
3
4*

`0*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

=0
a1
b2
c3
d4
e5
f6
g7
h8
i9
j10
k11
l12
m13
n14
o15
p16*
SM
VARIABLE_VALUE	iteration0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUElearning_rate3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
<
a0
c1
e2
g3
i4
k5
m6
o7*
<
b0
d1
f2
h3
j4
l5
n6
p7*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
8
q	variables
r	keras_api
	stotal
	tcount*
^X
VARIABLE_VALUEAdam/m/dense/kernel1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/v/dense/kernel1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEAdam/m/dense/bias1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEAdam/v/dense/bias1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/m/dense_1/kernel1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/v/dense_1/kernel1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/m/dense_1/bias1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/v/dense_1/bias1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/m/dense_2/kernel1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEAdam/v/dense_2/kernel2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/m/dense_2/bias2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/v/dense_2/bias2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEAdam/m/dense_3/kernel2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEAdam/v/dense_3/kernel2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/m/dense_3/bias2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/v/dense_3/bias2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUE*

s0
t1*

q	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
Ü

StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename dense/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOp"dense_2/kernel/Read/ReadVariableOp dense_2/bias/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp dense_3/bias/Read/ReadVariableOpiteration/Read/ReadVariableOp!learning_rate/Read/ReadVariableOp'Adam/m/dense/kernel/Read/ReadVariableOp'Adam/v/dense/kernel/Read/ReadVariableOp%Adam/m/dense/bias/Read/ReadVariableOp%Adam/v/dense/bias/Read/ReadVariableOp)Adam/m/dense_1/kernel/Read/ReadVariableOp)Adam/v/dense_1/kernel/Read/ReadVariableOp'Adam/m/dense_1/bias/Read/ReadVariableOp'Adam/v/dense_1/bias/Read/ReadVariableOp)Adam/m/dense_2/kernel/Read/ReadVariableOp)Adam/v/dense_2/kernel/Read/ReadVariableOp'Adam/m/dense_2/bias/Read/ReadVariableOp'Adam/v/dense_2/bias/Read/ReadVariableOp)Adam/m/dense_3/kernel/Read/ReadVariableOp)Adam/v/dense_3/kernel/Read/ReadVariableOp'Adam/m/dense_3/bias/Read/ReadVariableOp'Adam/v/dense_3/bias/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOpConst*)
Tin"
 2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *)
f$R"
 __inference__traced_save_3379335
§
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedense/kernel
dense/biasdense_1/kerneldense_1/biasdense_2/kerneldense_2/biasdense_3/kerneldense_3/bias	iterationlearning_rateAdam/m/dense/kernelAdam/v/dense/kernelAdam/m/dense/biasAdam/v/dense/biasAdam/m/dense_1/kernelAdam/v/dense_1/kernelAdam/m/dense_1/biasAdam/v/dense_1/biasAdam/m/dense_2/kernelAdam/v/dense_2/kernelAdam/m/dense_2/biasAdam/v/dense_2/biasAdam/m/dense_3/kernelAdam/v/dense_3/kernelAdam/m/dense_3/biasAdam/v/dense_3/biastotalcount*(
Tin!
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *,
f'R%
#__inference__traced_restore_3379429­
Ć	
ž
'__inference_model_layer_call_fn_3378639
input_1
unknown:

	unknown_0:	
	unknown_1:

	unknown_2:	
	unknown_3:	@
	unknown_4:@
	unknown_5:@
	unknown_6:
identity˘StatefulPartitionedCallŚ
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_model_layer_call_and_return_conditional_losses_3378599o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
!
_user_specified_name	input_1
ö

$__inference_internal_grad_fn_3379233
result_grads_0
result_grads_1
mul_dense_2_beta
mul_dense_2_biasadd
identityt
mulMulmul_dense_2_betamul_dense_2_biasadd^result_grads_0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@M
SigmoidSigmoidmul:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@e
mul_1Mulmul_dense_2_betamul_dense_2_biasadd*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y
subSubsub/x:output:0Sigmoid:y:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@R
mul_2Mul	mul_1:z:0sub:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y
addAddV2add/x:output:0	mul_2:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@T
mul_3MulSigmoid:y:0add:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Y
mul_4Mulresult_grads_0	mul_3:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Q
IdentityIdentity	mul_4:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@"
identityIdentity:output:0*N
_input_shapes=
;:˙˙˙˙˙˙˙˙˙@:˙˙˙˙˙˙˙˙˙@: :˙˙˙˙˙˙˙˙˙@: {
&
 _has_manual_control_dependencies(
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
(
_user_specified_nameresult_grads_0:WS
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
(
_user_specified_nameresult_grads_1:

_output_shapes
: :-)
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ă
ň
B__inference_model_layer_call_and_return_conditional_losses_3378493

inputs!
dense_3378423:

dense_3378425:	#
dense_1_3378447:

dense_1_3378449:	"
dense_2_3378471:	@
dense_2_3378473:@!
dense_3_3378487:@
dense_3_3378489:
identity˘dense/StatefulPartitionedCall˘dense_1/StatefulPartitionedCall˘dense_2/StatefulPartitionedCall˘dense_3/StatefulPartitionedCallč
dense/StatefulPartitionedCallStatefulPartitionedCallinputsdense_3378423dense_3378425*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_3378422
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_3378447dense_1_3378449*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_1_layer_call_and_return_conditional_losses_3378446
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_3378471dense_2_3378473*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_2_layer_call_and_return_conditional_losses_3378470
dense_3/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0dense_3_3378487dense_3_3378489*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_3_layer_call_and_return_conditional_losses_3378486w
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙Ě
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ť
ú
D__inference_dense_1_layer_call_and_return_conditional_losses_3378446

inputs2
matmul_readvariableop_resource:
.
biasadd_readvariableop_resource:	

identity_1˘BiasAdd/ReadVariableOp˘MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙I
betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?^
mulMulbeta:output:0BiasAdd:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙^
mul_1MulBiasAdd:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_1:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙­
	IdentityN	IdentityN	mul_1:z:0BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378438*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙d

Identity_1IdentityIdentityN:output:0^NoOp*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ĺ

'__inference_dense_layer_call_fn_3378867

inputs
unknown:

	unknown_0:	
identity˘StatefulPartitionedCallŘ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_3378422p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ć
ó
B__inference_model_layer_call_and_return_conditional_losses_3378687
input_1!
dense_3378666:

dense_3378668:	#
dense_1_3378671:

dense_1_3378673:	"
dense_2_3378676:	@
dense_2_3378678:@!
dense_3_3378681:@
dense_3_3378683:
identity˘dense/StatefulPartitionedCall˘dense_1/StatefulPartitionedCall˘dense_2/StatefulPartitionedCall˘dense_3/StatefulPartitionedCallé
dense/StatefulPartitionedCallStatefulPartitionedCallinput_1dense_3378666dense_3378668*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_3378422
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_3378671dense_1_3378673*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_1_layer_call_and_return_conditional_losses_3378446
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_3378676dense_2_3378678*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_2_layer_call_and_return_conditional_losses_3378470
dense_3/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0dense_3_3378681dense_3_3378683*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_3_layer_call_and_return_conditional_losses_3378486w
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙Ě
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall:Q M
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
!
_user_specified_name	input_1
Ă	
˝
'__inference_model_layer_call_fn_3378754

inputs
unknown:

	unknown_0:	
	unknown_1:

	unknown_2:	
	unknown_3:	@
	unknown_4:@
	unknown_5:@
	unknown_6:
identity˘StatefulPartitionedCallĽ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_model_layer_call_and_return_conditional_losses_3378599o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs


$__inference_internal_grad_fn_3379161
result_grads_0
result_grads_1
mul_dense_1_beta
mul_dense_1_biasadd
identityu
mulMulmul_dense_1_betamul_dense_1_biasadd^result_grads_0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙f
mul_1Mulmul_dense_1_betamul_dense_1_biasadd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙S
mul_2Mul	mul_1:z:0sub:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
addAddV2add/x:output:0	mul_2:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
mul_3MulSigmoid:y:0add:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
mul_4Mulresult_grads_0	mul_3:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_4:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*Q
_input_shapes@
>:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙: :˙˙˙˙˙˙˙˙˙: |
&
 _has_manual_control_dependencies(
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_0:XT
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_1:

_output_shapes
: :.*
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
ť
ú
D__inference_dense_1_layer_call_and_return_conditional_losses_3378912

inputs2
matmul_readvariableop_resource:
.
biasadd_readvariableop_resource:	

identity_1˘BiasAdd/ReadVariableOp˘MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙I
betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?^
mulMulbeta:output:0BiasAdd:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙^
mul_1MulBiasAdd:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_1:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙­
	IdentityN	IdentityN	mul_1:z:0BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378904*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙d

Identity_1IdentityIdentityN:output:0^NoOp*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ĺ
{
$__inference_internal_grad_fn_3379053
result_grads_0
result_grads_1
mul_beta
mul_biasadd
identityd
mulMulmul_betamul_biasadd^result_grads_0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@M
SigmoidSigmoidmul:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@U
mul_1Mulmul_betamul_biasadd*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y
subSubsub/x:output:0Sigmoid:y:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@R
mul_2Mul	mul_1:z:0sub:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y
addAddV2add/x:output:0	mul_2:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@T
mul_3MulSigmoid:y:0add:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Y
mul_4Mulresult_grads_0	mul_3:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Q
IdentityIdentity	mul_4:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@"
identityIdentity:output:0*N
_input_shapes=
;:˙˙˙˙˙˙˙˙˙@:˙˙˙˙˙˙˙˙˙@: :˙˙˙˙˙˙˙˙˙@: {
&
 _has_manual_control_dependencies(
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
(
_user_specified_nameresult_grads_0:WS
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
(
_user_specified_nameresult_grads_1:

_output_shapes
: :-)
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ĺ
{
$__inference_internal_grad_fn_3379035
result_grads_0
result_grads_1
mul_beta
mul_biasadd
identityd
mulMulmul_betamul_biasadd^result_grads_0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@M
SigmoidSigmoidmul:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@U
mul_1Mulmul_betamul_biasadd*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y
subSubsub/x:output:0Sigmoid:y:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@R
mul_2Mul	mul_1:z:0sub:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y
addAddV2add/x:output:0	mul_2:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@T
mul_3MulSigmoid:y:0add:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Y
mul_4Mulresult_grads_0	mul_3:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Q
IdentityIdentity	mul_4:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@"
identityIdentity:output:0*N
_input_shapes=
;:˙˙˙˙˙˙˙˙˙@:˙˙˙˙˙˙˙˙˙@: :˙˙˙˙˙˙˙˙˙@: {
&
 _has_manual_control_dependencies(
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
(
_user_specified_nameresult_grads_0:WS
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
(
_user_specified_nameresult_grads_1:

_output_shapes
: :-)
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ç	
ő
D__inference_dense_3_layer_call_and_return_conditional_losses_3378958

inputs0
matmul_readvariableop_resource:@-
biasadd_readvariableop_resource:
identity˘BiasAdd/ReadVariableOp˘MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:˙˙˙˙˙˙˙˙˙@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs
Ž
ř
D__inference_dense_2_layer_call_and_return_conditional_losses_3378470

inputs1
matmul_readvariableop_resource:	@-
biasadd_readvariableop_resource:@

identity_1˘BiasAdd/ReadVariableOp˘MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@I
betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?]
mulMulbeta:output:0BiasAdd:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@M
SigmoidSigmoidmul:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@]
mul_1MulBiasAdd:output:0Sigmoid:y:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Q
IdentityIdentity	mul_1:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Ť
	IdentityN	IdentityN	mul_1:z:0BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378462*:
_output_shapes(
&:˙˙˙˙˙˙˙˙˙@:˙˙˙˙˙˙˙˙˙@c

Identity_1IdentityIdentityN:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ő
{
$__inference_internal_grad_fn_3379089
result_grads_0
result_grads_1
mul_beta
mul_biasadd
identitye
mulMulmul_betamul_biasadd^result_grads_0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙V
mul_1Mulmul_betamul_biasadd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙S
mul_2Mul	mul_1:z:0sub:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
addAddV2add/x:output:0	mul_2:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
mul_3MulSigmoid:y:0add:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
mul_4Mulresult_grads_0	mul_3:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_4:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*Q
_input_shapes@
>:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙: :˙˙˙˙˙˙˙˙˙: |
&
 _has_manual_control_dependencies(
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_0:XT
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_1:

_output_shapes
: :.*
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ř6
é
"__inference__wrapped_model_3378397
input_1>
*model_dense_matmul_readvariableop_resource:
:
+model_dense_biasadd_readvariableop_resource:	@
,model_dense_1_matmul_readvariableop_resource:
<
-model_dense_1_biasadd_readvariableop_resource:	?
,model_dense_2_matmul_readvariableop_resource:	@;
-model_dense_2_biasadd_readvariableop_resource:@>
,model_dense_3_matmul_readvariableop_resource:@;
-model_dense_3_biasadd_readvariableop_resource:
identity˘"model/dense/BiasAdd/ReadVariableOp˘!model/dense/MatMul/ReadVariableOp˘$model/dense_1/BiasAdd/ReadVariableOp˘#model/dense_1/MatMul/ReadVariableOp˘$model/dense_2/BiasAdd/ReadVariableOp˘#model/dense_2/MatMul/ReadVariableOp˘$model/dense_3/BiasAdd/ReadVariableOp˘#model/dense_3/MatMul/ReadVariableOp
!model/dense/MatMul/ReadVariableOpReadVariableOp*model_dense_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
model/dense/MatMulMatMulinput_1)model/dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
"model/dense/BiasAdd/ReadVariableOpReadVariableOp+model_dense_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
model/dense/BiasAddBiasAddmodel/dense/MatMul:product:0*model/dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
model/dense/betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
model/dense/mulMulmodel/dense/beta:output:0model/dense/BiasAdd:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙f
model/dense/SigmoidSigmoidmodel/dense/mul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
model/dense/mul_1Mulmodel/dense/BiasAdd:output:0model/dense/Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙j
model/dense/IdentityIdentitymodel/dense/mul_1:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ń
model/dense/IdentityN	IdentityNmodel/dense/mul_1:z:0model/dense/BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378355*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
#model/dense_1/MatMul/ReadVariableOpReadVariableOp,model_dense_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
model/dense_1/MatMulMatMulmodel/dense/IdentityN:output:0+model/dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
$model/dense_1/BiasAdd/ReadVariableOpReadVariableOp-model_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0Ą
model/dense_1/BiasAddBiasAddmodel/dense_1/MatMul:product:0,model/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙W
model/dense_1/betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
model/dense_1/mulMulmodel/dense_1/beta:output:0model/dense_1/BiasAdd:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙j
model/dense_1/SigmoidSigmoidmodel/dense_1/mul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
model/dense_1/mul_1Mulmodel/dense_1/BiasAdd:output:0model/dense_1/Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙n
model/dense_1/IdentityIdentitymodel/dense_1/mul_1:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙×
model/dense_1/IdentityN	IdentityNmodel/dense_1/mul_1:z:0model/dense_1/BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378369*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
#model/dense_2/MatMul/ReadVariableOpReadVariableOp,model_dense_2_matmul_readvariableop_resource*
_output_shapes
:	@*
dtype0
model/dense_2/MatMulMatMul model/dense_1/IdentityN:output:0+model/dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
$model/dense_2/BiasAdd/ReadVariableOpReadVariableOp-model_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0 
model/dense_2/BiasAddBiasAddmodel/dense_2/MatMul:product:0,model/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@W
model/dense_2/betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
model/dense_2/mulMulmodel/dense_2/beta:output:0model/dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@i
model/dense_2/SigmoidSigmoidmodel/dense_2/mul:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
model/dense_2/mul_1Mulmodel/dense_2/BiasAdd:output:0model/dense_2/Sigmoid:y:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@m
model/dense_2/IdentityIdentitymodel/dense_2/mul_1:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Ő
model/dense_2/IdentityN	IdentityNmodel/dense_2/mul_1:z:0model/dense_2/BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378383*:
_output_shapes(
&:˙˙˙˙˙˙˙˙˙@:˙˙˙˙˙˙˙˙˙@
#model/dense_3/MatMul/ReadVariableOpReadVariableOp,model_dense_3_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0
model/dense_3/MatMulMatMul model/dense_2/IdentityN:output:0+model/dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
$model/dense_3/BiasAdd/ReadVariableOpReadVariableOp-model_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0 
model/dense_3/BiasAddBiasAddmodel/dense_3/MatMul:product:0,model/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙m
IdentityIdentitymodel/dense_3/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙ö
NoOpNoOp#^model/dense/BiasAdd/ReadVariableOp"^model/dense/MatMul/ReadVariableOp%^model/dense_1/BiasAdd/ReadVariableOp$^model/dense_1/MatMul/ReadVariableOp%^model/dense_2/BiasAdd/ReadVariableOp$^model/dense_2/MatMul/ReadVariableOp%^model/dense_3/BiasAdd/ReadVariableOp$^model/dense_3/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 2H
"model/dense/BiasAdd/ReadVariableOp"model/dense/BiasAdd/ReadVariableOp2F
!model/dense/MatMul/ReadVariableOp!model/dense/MatMul/ReadVariableOp2L
$model/dense_1/BiasAdd/ReadVariableOp$model/dense_1/BiasAdd/ReadVariableOp2J
#model/dense_1/MatMul/ReadVariableOp#model/dense_1/MatMul/ReadVariableOp2L
$model/dense_2/BiasAdd/ReadVariableOp$model/dense_2/BiasAdd/ReadVariableOp2J
#model/dense_2/MatMul/ReadVariableOp#model/dense_2/MatMul/ReadVariableOp2L
$model/dense_3/BiasAdd/ReadVariableOp$model/dense_3/BiasAdd/ReadVariableOp2J
#model/dense_3/MatMul/ReadVariableOp#model/dense_3/MatMul/ReadVariableOp:Q M
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
!
_user_specified_name	input_1
¤	
ź
%__inference_signature_wrapper_3378712
input_1
unknown:

	unknown_0:	
	unknown_1:

	unknown_2:	
	unknown_3:	@
	unknown_4:@
	unknown_5:@
	unknown_6:
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *+
f&R$
"__inference__wrapped_model_3378397o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
!
_user_specified_name	input_1
Ő
{
$__inference_internal_grad_fn_3379125
result_grads_0
result_grads_1
mul_beta
mul_biasadd
identitye
mulMulmul_betamul_biasadd^result_grads_0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙V
mul_1Mulmul_betamul_biasadd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙S
mul_2Mul	mul_1:z:0sub:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
addAddV2add/x:output:0	mul_2:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
mul_3MulSigmoid:y:0add:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
mul_4Mulresult_grads_0	mul_3:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_4:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*Q
_input_shapes@
>:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙: :˙˙˙˙˙˙˙˙˙: |
&
 _has_manual_control_dependencies(
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_0:XT
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_1:

_output_shapes
: :.*
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ă	
˝
'__inference_model_layer_call_fn_3378733

inputs
unknown:

	unknown_0:	
	unknown_1:

	unknown_2:	
	unknown_3:	@
	unknown_4:@
	unknown_5:@
	unknown_6:
identity˘StatefulPartitionedCallĽ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_model_layer_call_and_return_conditional_losses_3378493o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ú

$__inference_internal_grad_fn_3379197
result_grads_0
result_grads_1
mul_dense_beta
mul_dense_biasadd
identityq
mulMulmul_dense_betamul_dense_biasadd^result_grads_0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙b
mul_1Mulmul_dense_betamul_dense_biasadd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙S
mul_2Mul	mul_1:z:0sub:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
addAddV2add/x:output:0	mul_2:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
mul_3MulSigmoid:y:0add:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
mul_4Mulresult_grads_0	mul_3:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_4:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*Q
_input_shapes@
>:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙: :˙˙˙˙˙˙˙˙˙: |
&
 _has_manual_control_dependencies(
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_0:XT
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_1:

_output_shapes
: :.*
(
_output_shapes
:˙˙˙˙˙˙˙˙˙


$__inference_internal_grad_fn_3379215
result_grads_0
result_grads_1
mul_dense_1_beta
mul_dense_1_biasadd
identityu
mulMulmul_dense_1_betamul_dense_1_biasadd^result_grads_0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙f
mul_1Mulmul_dense_1_betamul_dense_1_biasadd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙S
mul_2Mul	mul_1:z:0sub:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
addAddV2add/x:output:0	mul_2:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
mul_3MulSigmoid:y:0add:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
mul_4Mulresult_grads_0	mul_3:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_4:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*Q
_input_shapes@
>:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙: :˙˙˙˙˙˙˙˙˙: |
&
 _has_manual_control_dependencies(
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_0:XT
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_1:

_output_shapes
: :.*
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
š
ř
B__inference_dense_layer_call_and_return_conditional_losses_3378422

inputs2
matmul_readvariableop_resource:
.
biasadd_readvariableop_resource:	

identity_1˘BiasAdd/ReadVariableOp˘MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙I
betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?^
mulMulbeta:output:0BiasAdd:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙^
mul_1MulBiasAdd:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_1:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙­
	IdentityN	IdentityN	mul_1:z:0BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378414*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙d

Identity_1IdentityIdentityN:output:0^NoOp*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ç	
ő
D__inference_dense_3_layer_call_and_return_conditional_losses_3378486

inputs0
matmul_readvariableop_resource:@-
biasadd_readvariableop_resource:
identity˘BiasAdd/ReadVariableOp˘MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:˙˙˙˙˙˙˙˙˙@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs
Ć
ó
B__inference_model_layer_call_and_return_conditional_losses_3378663
input_1!
dense_3378642:

dense_3378644:	#
dense_1_3378647:

dense_1_3378649:	"
dense_2_3378652:	@
dense_2_3378654:@!
dense_3_3378657:@
dense_3_3378659:
identity˘dense/StatefulPartitionedCall˘dense_1/StatefulPartitionedCall˘dense_2/StatefulPartitionedCall˘dense_3/StatefulPartitionedCallé
dense/StatefulPartitionedCallStatefulPartitionedCallinput_1dense_3378642dense_3378644*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_3378422
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_3378647dense_1_3378649*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_1_layer_call_and_return_conditional_losses_3378446
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_3378652dense_2_3378654*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_2_layer_call_and_return_conditional_losses_3378470
dense_3/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0dense_3_3378657dense_3_3378659*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_3_layer_call_and_return_conditional_losses_3378486w
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙Ě
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall:Q M
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
!
_user_specified_name	input_1
Ă
ň
B__inference_model_layer_call_and_return_conditional_losses_3378599

inputs!
dense_3378578:

dense_3378580:	#
dense_1_3378583:

dense_1_3378585:	"
dense_2_3378588:	@
dense_2_3378590:@!
dense_3_3378593:@
dense_3_3378595:
identity˘dense/StatefulPartitionedCall˘dense_1/StatefulPartitionedCall˘dense_2/StatefulPartitionedCall˘dense_3/StatefulPartitionedCallč
dense/StatefulPartitionedCallStatefulPartitionedCallinputsdense_3378578dense_3378580*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_3378422
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_3378583dense_1_3378585*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_1_layer_call_and_return_conditional_losses_3378446
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_3378588dense_2_3378590*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_2_layer_call_and_return_conditional_losses_3378470
dense_3/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0dense_3_3378593dense_3_3378595*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_3_layer_call_and_return_conditional_losses_3378486w
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙Ě
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Â

)__inference_dense_3_layer_call_fn_3378948

inputs
unknown:@
	unknown_0:
identity˘StatefulPartitionedCallŮ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_3_layer_call_and_return_conditional_losses_3378486o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:˙˙˙˙˙˙˙˙˙@: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs
Ť

$__inference_internal_grad_fn_3379269
result_grads_0
result_grads_1
mul_model_dense_1_beta
mul_model_dense_1_biasadd
identity
mulMulmul_model_dense_1_betamul_model_dense_1_biasadd^result_grads_0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙r
mul_1Mulmul_model_dense_1_betamul_model_dense_1_biasadd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙S
mul_2Mul	mul_1:z:0sub:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
addAddV2add/x:output:0	mul_2:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
mul_3MulSigmoid:y:0add:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
mul_4Mulresult_grads_0	mul_3:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_4:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*Q
_input_shapes@
>:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙: :˙˙˙˙˙˙˙˙˙: |
&
 _has_manual_control_dependencies(
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_0:XT
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_1:

_output_shapes
: :.*
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
<
Ĺ
 __inference__traced_save_3379335
file_prefix+
'savev2_dense_kernel_read_readvariableop)
%savev2_dense_bias_read_readvariableop-
)savev2_dense_1_kernel_read_readvariableop+
'savev2_dense_1_bias_read_readvariableop-
)savev2_dense_2_kernel_read_readvariableop+
'savev2_dense_2_bias_read_readvariableop-
)savev2_dense_3_kernel_read_readvariableop+
'savev2_dense_3_bias_read_readvariableop(
$savev2_iteration_read_readvariableop	,
(savev2_learning_rate_read_readvariableop2
.savev2_adam_m_dense_kernel_read_readvariableop2
.savev2_adam_v_dense_kernel_read_readvariableop0
,savev2_adam_m_dense_bias_read_readvariableop0
,savev2_adam_v_dense_bias_read_readvariableop4
0savev2_adam_m_dense_1_kernel_read_readvariableop4
0savev2_adam_v_dense_1_kernel_read_readvariableop2
.savev2_adam_m_dense_1_bias_read_readvariableop2
.savev2_adam_v_dense_1_bias_read_readvariableop4
0savev2_adam_m_dense_2_kernel_read_readvariableop4
0savev2_adam_v_dense_2_kernel_read_readvariableop2
.savev2_adam_m_dense_2_bias_read_readvariableop2
.savev2_adam_v_dense_2_bias_read_readvariableop4
0savev2_adam_m_dense_3_kernel_read_readvariableop4
0savev2_adam_v_dense_3_kernel_read_readvariableop2
.savev2_adam_m_dense_3_bias_read_readvariableop2
.savev2_adam_v_dense_3_bias_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop
savev2_const

identity_1˘MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: Ě
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*ő
valueëBčB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH§
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*M
valueDBBB B B B B B B B B B B B B B B B B B B B B B B B B B B B B Ü
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0'savev2_dense_kernel_read_readvariableop%savev2_dense_bias_read_readvariableop)savev2_dense_1_kernel_read_readvariableop'savev2_dense_1_bias_read_readvariableop)savev2_dense_2_kernel_read_readvariableop'savev2_dense_2_bias_read_readvariableop)savev2_dense_3_kernel_read_readvariableop'savev2_dense_3_bias_read_readvariableop$savev2_iteration_read_readvariableop(savev2_learning_rate_read_readvariableop.savev2_adam_m_dense_kernel_read_readvariableop.savev2_adam_v_dense_kernel_read_readvariableop,savev2_adam_m_dense_bias_read_readvariableop,savev2_adam_v_dense_bias_read_readvariableop0savev2_adam_m_dense_1_kernel_read_readvariableop0savev2_adam_v_dense_1_kernel_read_readvariableop.savev2_adam_m_dense_1_bias_read_readvariableop.savev2_adam_v_dense_1_bias_read_readvariableop0savev2_adam_m_dense_2_kernel_read_readvariableop0savev2_adam_v_dense_2_kernel_read_readvariableop.savev2_adam_m_dense_2_bias_read_readvariableop.savev2_adam_v_dense_2_bias_read_readvariableop0savev2_adam_m_dense_3_kernel_read_readvariableop0savev2_adam_v_dense_3_kernel_read_readvariableop.savev2_adam_m_dense_3_bias_read_readvariableop.savev2_adam_v_dense_3_bias_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableopsavev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *+
dtypes!
2	
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:ł
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*ö
_input_shapesä
á: :
::
::	@:@:@:: : :
:
:::
:
:::	@:	@:@:@:@:@::: : : 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:&"
 
_output_shapes
:
:!

_output_shapes	
::&"
 
_output_shapes
:
:!

_output_shapes	
::%!

_output_shapes
:	@: 

_output_shapes
:@:$ 

_output_shapes

:@: 

_output_shapes
::	

_output_shapes
: :


_output_shapes
: :&"
 
_output_shapes
:
:&"
 
_output_shapes
:
:!

_output_shapes	
::!

_output_shapes	
::&"
 
_output_shapes
:
:&"
 
_output_shapes
:
:!

_output_shapes	
::!

_output_shapes	
::%!

_output_shapes
:	@:%!

_output_shapes
:	@: 

_output_shapes
:@: 

_output_shapes
:@:$ 

_output_shapes

:@:$ 

_output_shapes

:@: 

_output_shapes
:: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: 
ú

$__inference_internal_grad_fn_3379143
result_grads_0
result_grads_1
mul_dense_beta
mul_dense_biasadd
identityq
mulMulmul_dense_betamul_dense_biasadd^result_grads_0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙b
mul_1Mulmul_dense_betamul_dense_biasadd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙S
mul_2Mul	mul_1:z:0sub:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
addAddV2add/x:output:0	mul_2:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
mul_3MulSigmoid:y:0add:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
mul_4Mulresult_grads_0	mul_3:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_4:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*Q
_input_shapes@
>:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙: :˙˙˙˙˙˙˙˙˙: |
&
 _has_manual_control_dependencies(
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_0:XT
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_1:

_output_shapes
: :.*
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
1
¨
B__inference_model_layer_call_and_return_conditional_losses_3378806

inputs8
$dense_matmul_readvariableop_resource:
4
%dense_biasadd_readvariableop_resource:	:
&dense_1_matmul_readvariableop_resource:
6
'dense_1_biasadd_readvariableop_resource:	9
&dense_2_matmul_readvariableop_resource:	@5
'dense_2_biasadd_readvariableop_resource:@8
&dense_3_matmul_readvariableop_resource:@5
'dense_3_biasadd_readvariableop_resource:
identity˘dense/BiasAdd/ReadVariableOp˘dense/MatMul/ReadVariableOp˘dense_1/BiasAdd/ReadVariableOp˘dense_1/MatMul/ReadVariableOp˘dense_2/BiasAdd/ReadVariableOp˘dense_2/MatMul/ReadVariableOp˘dense_3/BiasAdd/ReadVariableOp˘dense_3/MatMul/ReadVariableOp
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0v
dense/MatMulMatMulinputs#dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙O

dense/betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?p
	dense/mulMuldense/beta:output:0dense/BiasAdd:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
dense/SigmoidSigmoiddense/mul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙p
dense/mul_1Muldense/BiasAdd:output:0dense/Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙^
dense/IdentityIdentitydense/mul_1:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙ż
dense/IdentityN	IdentityNdense/mul_1:z:0dense/BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378764*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
dense_1/MatMulMatMuldense/IdentityN:output:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Q
dense_1/betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?v
dense_1/mulMuldense_1/beta:output:0dense_1/BiasAdd:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙^
dense_1/SigmoidSigmoiddense_1/mul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙v
dense_1/mul_1Muldense_1/BiasAdd:output:0dense_1/Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙b
dense_1/IdentityIdentitydense_1/mul_1:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ĺ
dense_1/IdentityN	IdentityNdense_1/mul_1:z:0dense_1/BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378778*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes
:	@*
dtype0
dense_2/MatMulMatMuldense_1/IdentityN:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Q
dense_2/betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?u
dense_2/mulMuldense_2/beta:output:0dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@]
dense_2/SigmoidSigmoiddense_2/mul:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@u
dense_2/mul_1Muldense_2/BiasAdd:output:0dense_2/Sigmoid:y:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@a
dense_2/IdentityIdentitydense_2/mul_1:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Ă
dense_2/IdentityN	IdentityNdense_2/mul_1:z:0dense_2/BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378792*:
_output_shapes(
&:˙˙˙˙˙˙˙˙˙@:˙˙˙˙˙˙˙˙˙@
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0
dense_3/MatMulMatMuldense_2/IdentityN:output:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙g
IdentityIdentitydense_3/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙Ć
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
É

)__inference_dense_1_layer_call_fn_3378894

inputs
unknown:

	unknown_0:	
identity˘StatefulPartitionedCallÚ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_1_layer_call_and_return_conditional_losses_3378446p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ő
{
$__inference_internal_grad_fn_3379071
result_grads_0
result_grads_1
mul_beta
mul_biasadd
identitye
mulMulmul_betamul_biasadd^result_grads_0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙V
mul_1Mulmul_betamul_biasadd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙S
mul_2Mul	mul_1:z:0sub:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
addAddV2add/x:output:0	mul_2:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
mul_3MulSigmoid:y:0add:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
mul_4Mulresult_grads_0	mul_3:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_4:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*Q
_input_shapes@
>:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙: :˙˙˙˙˙˙˙˙˙: |
&
 _has_manual_control_dependencies(
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_0:XT
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_1:

_output_shapes
: :.*
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
ö

$__inference_internal_grad_fn_3379179
result_grads_0
result_grads_1
mul_dense_2_beta
mul_dense_2_biasadd
identityt
mulMulmul_dense_2_betamul_dense_2_biasadd^result_grads_0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@M
SigmoidSigmoidmul:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@e
mul_1Mulmul_dense_2_betamul_dense_2_biasadd*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y
subSubsub/x:output:0Sigmoid:y:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@R
mul_2Mul	mul_1:z:0sub:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y
addAddV2add/x:output:0	mul_2:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@T
mul_3MulSigmoid:y:0add:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Y
mul_4Mulresult_grads_0	mul_3:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Q
IdentityIdentity	mul_4:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@"
identityIdentity:output:0*N
_input_shapes=
;:˙˙˙˙˙˙˙˙˙@:˙˙˙˙˙˙˙˙˙@: :˙˙˙˙˙˙˙˙˙@: {
&
 _has_manual_control_dependencies(
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
(
_user_specified_nameresult_grads_0:WS
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
(
_user_specified_nameresult_grads_1:

_output_shapes
: :-)
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@


$__inference_internal_grad_fn_3379287
result_grads_0
result_grads_1
mul_model_dense_2_beta
mul_model_dense_2_biasadd
identity
mulMulmul_model_dense_2_betamul_model_dense_2_biasadd^result_grads_0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@M
SigmoidSigmoidmul:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@q
mul_1Mulmul_model_dense_2_betamul_model_dense_2_biasadd*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y
subSubsub/x:output:0Sigmoid:y:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@R
mul_2Mul	mul_1:z:0sub:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y
addAddV2add/x:output:0	mul_2:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@T
mul_3MulSigmoid:y:0add:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Y
mul_4Mulresult_grads_0	mul_3:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Q
IdentityIdentity	mul_4:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@"
identityIdentity:output:0*N
_input_shapes=
;:˙˙˙˙˙˙˙˙˙@:˙˙˙˙˙˙˙˙˙@: :˙˙˙˙˙˙˙˙˙@: {
&
 _has_manual_control_dependencies(
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
(
_user_specified_nameresult_grads_0:WS
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
(
_user_specified_nameresult_grads_1:

_output_shapes
: :-)
'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ž
ř
D__inference_dense_2_layer_call_and_return_conditional_losses_3378939

inputs1
matmul_readvariableop_resource:	@-
biasadd_readvariableop_resource:@

identity_1˘BiasAdd/ReadVariableOp˘MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@I
betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?]
mulMulbeta:output:0BiasAdd:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@M
SigmoidSigmoidmul:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@]
mul_1MulBiasAdd:output:0Sigmoid:y:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Q
IdentityIdentity	mul_1:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Ť
	IdentityN	IdentityN	mul_1:z:0BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378931*:
_output_shapes(
&:˙˙˙˙˙˙˙˙˙@:˙˙˙˙˙˙˙˙˙@c

Identity_1IdentityIdentityN:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ő
{
$__inference_internal_grad_fn_3379107
result_grads_0
result_grads_1
mul_beta
mul_biasadd
identitye
mulMulmul_betamul_biasadd^result_grads_0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙V
mul_1Mulmul_betamul_biasadd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙S
mul_2Mul	mul_1:z:0sub:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
addAddV2add/x:output:0	mul_2:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
mul_3MulSigmoid:y:0add:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
mul_4Mulresult_grads_0	mul_3:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_4:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*Q
_input_shapes@
>:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙: :˙˙˙˙˙˙˙˙˙: |
&
 _has_manual_control_dependencies(
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_0:XT
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_1:

_output_shapes
: :.*
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ĺ

)__inference_dense_2_layer_call_fn_3378921

inputs
unknown:	@
	unknown_0:@
identity˘StatefulPartitionedCallŮ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_dense_2_layer_call_and_return_conditional_losses_3378470o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ć	
ž
'__inference_model_layer_call_fn_3378512
input_1
unknown:

	unknown_0:	
	unknown_1:

	unknown_2:	
	unknown_3:	@
	unknown_4:@
	unknown_5:@
	unknown_6:
identity˘StatefulPartitionedCallŚ
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙**
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_model_layer_call_and_return_conditional_losses_3378493o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
!
_user_specified_name	input_1
š
ř
B__inference_dense_layer_call_and_return_conditional_losses_3378885

inputs2
matmul_readvariableop_resource:
.
biasadd_readvariableop_resource:	

identity_1˘BiasAdd/ReadVariableOp˘MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙I
betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?^
mulMulbeta:output:0BiasAdd:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙^
mul_1MulBiasAdd:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_1:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙­
	IdentityN	IdentityN	mul_1:z:0BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378877*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙d

Identity_1IdentityIdentityN:output:0^NoOp*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
1
¨
B__inference_model_layer_call_and_return_conditional_losses_3378858

inputs8
$dense_matmul_readvariableop_resource:
4
%dense_biasadd_readvariableop_resource:	:
&dense_1_matmul_readvariableop_resource:
6
'dense_1_biasadd_readvariableop_resource:	9
&dense_2_matmul_readvariableop_resource:	@5
'dense_2_biasadd_readvariableop_resource:@8
&dense_3_matmul_readvariableop_resource:@5
'dense_3_biasadd_readvariableop_resource:
identity˘dense/BiasAdd/ReadVariableOp˘dense/MatMul/ReadVariableOp˘dense_1/BiasAdd/ReadVariableOp˘dense_1/MatMul/ReadVariableOp˘dense_2/BiasAdd/ReadVariableOp˘dense_2/MatMul/ReadVariableOp˘dense_3/BiasAdd/ReadVariableOp˘dense_3/MatMul/ReadVariableOp
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0v
dense/MatMulMatMulinputs#dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙O

dense/betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?p
	dense/mulMuldense/beta:output:0dense/BiasAdd:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
dense/SigmoidSigmoiddense/mul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙p
dense/mul_1Muldense/BiasAdd:output:0dense/Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙^
dense/IdentityIdentitydense/mul_1:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙ż
dense/IdentityN	IdentityNdense/mul_1:z:0dense/BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378816*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
dense_1/MatMulMatMuldense/IdentityN:output:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Q
dense_1/betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?v
dense_1/mulMuldense_1/beta:output:0dense_1/BiasAdd:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙^
dense_1/SigmoidSigmoiddense_1/mul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙v
dense_1/mul_1Muldense_1/BiasAdd:output:0dense_1/Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙b
dense_1/IdentityIdentitydense_1/mul_1:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ĺ
dense_1/IdentityN	IdentityNdense_1/mul_1:z:0dense_1/BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378830*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes
:	@*
dtype0
dense_2/MatMulMatMuldense_1/IdentityN:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Q
dense_2/betaConst*
_output_shapes
: *
dtype0*
valueB
 *  ?u
dense_2/mulMuldense_2/beta:output:0dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@]
dense_2/SigmoidSigmoiddense_2/mul:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@u
dense_2/mul_1Muldense_2/BiasAdd:output:0dense_2/Sigmoid:y:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@a
dense_2/IdentityIdentitydense_2/mul_1:z:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙@Ă
dense_2/IdentityN	IdentityNdense_2/mul_1:z:0dense_2/BiasAdd:output:0*
T
2*-
_gradient_op_typeCustomGradient-3378844*:
_output_shapes(
&:˙˙˙˙˙˙˙˙˙@:˙˙˙˙˙˙˙˙˙@
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0
dense_3/MatMulMatMuldense_2/IdentityN:output:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙g
IdentityIdentitydense_3/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙Ć
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:˙˙˙˙˙˙˙˙˙: : : : : : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
w
ű
#__inference__traced_restore_3379429
file_prefix1
assignvariableop_dense_kernel:
,
assignvariableop_1_dense_bias:	5
!assignvariableop_2_dense_1_kernel:
.
assignvariableop_3_dense_1_bias:	4
!assignvariableop_4_dense_2_kernel:	@-
assignvariableop_5_dense_2_bias:@3
!assignvariableop_6_dense_3_kernel:@-
assignvariableop_7_dense_3_bias:&
assignvariableop_8_iteration:	 *
 assignvariableop_9_learning_rate: ;
'assignvariableop_10_adam_m_dense_kernel:
;
'assignvariableop_11_adam_v_dense_kernel:
4
%assignvariableop_12_adam_m_dense_bias:	4
%assignvariableop_13_adam_v_dense_bias:	=
)assignvariableop_14_adam_m_dense_1_kernel:
=
)assignvariableop_15_adam_v_dense_1_kernel:
6
'assignvariableop_16_adam_m_dense_1_bias:	6
'assignvariableop_17_adam_v_dense_1_bias:	<
)assignvariableop_18_adam_m_dense_2_kernel:	@<
)assignvariableop_19_adam_v_dense_2_kernel:	@5
'assignvariableop_20_adam_m_dense_2_bias:@5
'assignvariableop_21_adam_v_dense_2_bias:@;
)assignvariableop_22_adam_m_dense_3_kernel:@;
)assignvariableop_23_adam_v_dense_3_kernel:@5
'assignvariableop_24_adam_m_dense_3_bias:5
'assignvariableop_25_adam_v_dense_3_bias:#
assignvariableop_26_total: #
assignvariableop_27_count: 
identity_29˘AssignVariableOp˘AssignVariableOp_1˘AssignVariableOp_10˘AssignVariableOp_11˘AssignVariableOp_12˘AssignVariableOp_13˘AssignVariableOp_14˘AssignVariableOp_15˘AssignVariableOp_16˘AssignVariableOp_17˘AssignVariableOp_18˘AssignVariableOp_19˘AssignVariableOp_2˘AssignVariableOp_20˘AssignVariableOp_21˘AssignVariableOp_22˘AssignVariableOp_23˘AssignVariableOp_24˘AssignVariableOp_25˘AssignVariableOp_26˘AssignVariableOp_27˘AssignVariableOp_3˘AssignVariableOp_4˘AssignVariableOp_5˘AssignVariableOp_6˘AssignVariableOp_7˘AssignVariableOp_8˘AssignVariableOp_9Ď
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*ő
valueëBčB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHŞ
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*M
valueDBBB B B B B B B B B B B B B B B B B B B B B B B B B B B B B °
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*
_output_shapesv
t:::::::::::::::::::::::::::::*+
dtypes!
2	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:°
AssignVariableOpAssignVariableOpassignvariableop_dense_kernelIdentity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:´
AssignVariableOp_1AssignVariableOpassignvariableop_1_dense_biasIdentity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:¸
AssignVariableOp_2AssignVariableOp!assignvariableop_2_dense_1_kernelIdentity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:ś
AssignVariableOp_3AssignVariableOpassignvariableop_3_dense_1_biasIdentity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:¸
AssignVariableOp_4AssignVariableOp!assignvariableop_4_dense_2_kernelIdentity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:ś
AssignVariableOp_5AssignVariableOpassignvariableop_5_dense_2_biasIdentity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:¸
AssignVariableOp_6AssignVariableOp!assignvariableop_6_dense_3_kernelIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:ś
AssignVariableOp_7AssignVariableOpassignvariableop_7_dense_3_biasIdentity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0	*
_output_shapes
:ł
AssignVariableOp_8AssignVariableOpassignvariableop_8_iterationIdentity_8:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:ˇ
AssignVariableOp_9AssignVariableOp assignvariableop_9_learning_rateIdentity_9:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:Ŕ
AssignVariableOp_10AssignVariableOp'assignvariableop_10_adam_m_dense_kernelIdentity_10:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:Ŕ
AssignVariableOp_11AssignVariableOp'assignvariableop_11_adam_v_dense_kernelIdentity_11:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:ž
AssignVariableOp_12AssignVariableOp%assignvariableop_12_adam_m_dense_biasIdentity_12:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:ž
AssignVariableOp_13AssignVariableOp%assignvariableop_13_adam_v_dense_biasIdentity_13:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:Â
AssignVariableOp_14AssignVariableOp)assignvariableop_14_adam_m_dense_1_kernelIdentity_14:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:Â
AssignVariableOp_15AssignVariableOp)assignvariableop_15_adam_v_dense_1_kernelIdentity_15:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:Ŕ
AssignVariableOp_16AssignVariableOp'assignvariableop_16_adam_m_dense_1_biasIdentity_16:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:Ŕ
AssignVariableOp_17AssignVariableOp'assignvariableop_17_adam_v_dense_1_biasIdentity_17:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:Â
AssignVariableOp_18AssignVariableOp)assignvariableop_18_adam_m_dense_2_kernelIdentity_18:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:Â
AssignVariableOp_19AssignVariableOp)assignvariableop_19_adam_v_dense_2_kernelIdentity_19:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:Ŕ
AssignVariableOp_20AssignVariableOp'assignvariableop_20_adam_m_dense_2_biasIdentity_20:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:Ŕ
AssignVariableOp_21AssignVariableOp'assignvariableop_21_adam_v_dense_2_biasIdentity_21:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:Â
AssignVariableOp_22AssignVariableOp)assignvariableop_22_adam_m_dense_3_kernelIdentity_22:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:Â
AssignVariableOp_23AssignVariableOp)assignvariableop_23_adam_v_dense_3_kernelIdentity_23:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:Ŕ
AssignVariableOp_24AssignVariableOp'assignvariableop_24_adam_m_dense_3_biasIdentity_24:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:Ŕ
AssignVariableOp_25AssignVariableOp'assignvariableop_25_adam_v_dense_3_biasIdentity_25:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:˛
AssignVariableOp_26AssignVariableOpassignvariableop_26_totalIdentity_26:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:˛
AssignVariableOp_27AssignVariableOpassignvariableop_27_countIdentity_27:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 ˇ
Identity_28Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_29IdentityIdentity_28:output:0^NoOp_1*
T0*
_output_shapes
: ¤
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_29Identity_29:output:0*M
_input_shapes<
:: : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix


$__inference_internal_grad_fn_3379251
result_grads_0
result_grads_1
mul_model_dense_beta
mul_model_dense_biasadd
identity}
mulMulmul_model_dense_betamul_model_dense_biasadd^result_grads_0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙N
SigmoidSigmoidmul:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙n
mul_1Mulmul_model_dense_betamul_model_dense_biasadd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙S
mul_2Mul	mul_1:z:0sub:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Z
addAddV2add/x:output:0	mul_2:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙U
mul_3MulSigmoid:y:0add:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Z
mul_4Mulresult_grads_0	mul_3:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙R
IdentityIdentity	mul_4:z:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*Q
_input_shapes@
>:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙: :˙˙˙˙˙˙˙˙˙: |
&
 _has_manual_control_dependencies(
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_0:XT
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
(
_user_specified_nameresult_grads_1:

_output_shapes
: :.*
(
_output_shapes
:˙˙˙˙˙˙˙˙˙>
$__inference_internal_grad_fn_3379035CustomGradient-3378931>
$__inference_internal_grad_fn_3379053CustomGradient-3378462>
$__inference_internal_grad_fn_3379071CustomGradient-3378904>
$__inference_internal_grad_fn_3379089CustomGradient-3378438>
$__inference_internal_grad_fn_3379107CustomGradient-3378877>
$__inference_internal_grad_fn_3379125CustomGradient-3378414>
$__inference_internal_grad_fn_3379143CustomGradient-3378816>
$__inference_internal_grad_fn_3379161CustomGradient-3378830>
$__inference_internal_grad_fn_3379179CustomGradient-3378844>
$__inference_internal_grad_fn_3379197CustomGradient-3378764>
$__inference_internal_grad_fn_3379215CustomGradient-3378778>
$__inference_internal_grad_fn_3379233CustomGradient-3378792>
$__inference_internal_grad_fn_3379251CustomGradient-3378355>
$__inference_internal_grad_fn_3379269CustomGradient-3378369>
$__inference_internal_grad_fn_3379287CustomGradient-3378383"
L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Ť
serving_default
<
input_11
serving_default_input_1:0˙˙˙˙˙˙˙˙˙;
dense_30
StatefulPartitionedCall:0˙˙˙˙˙˙˙˙˙tensorflow/serving/predict:´Ź

layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer_with_weights-2
layer-3
layer_with_weights-3
layer-4
	variables
trainable_variables
regularization_losses
		keras_api

__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_network
"
_tf_keras_input_layer
ť
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias"
_tf_keras_layer
ť
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias"
_tf_keras_layer
ť
	variables
 trainable_variables
!regularization_losses
"	keras_api
#__call__
*$&call_and_return_all_conditional_losses

%kernel
&bias"
_tf_keras_layer
ť
'	variables
(trainable_variables
)regularization_losses
*	keras_api
+__call__
*,&call_and_return_all_conditional_losses

-kernel
.bias"
_tf_keras_layer
X
0
1
2
3
%4
&5
-6
.7"
trackable_list_wrapper
X
0
1
2
3
%4
&5
-6
.7"
trackable_list_wrapper
 "
trackable_list_wrapper
Ę
/non_trainable_variables

0layers
1metrics
2layer_regularization_losses
3layer_metrics
	variables
trainable_variables
regularization_losses

__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
Ń
4trace_0
5trace_1
6trace_2
7trace_32ć
'__inference_model_layer_call_fn_3378512
'__inference_model_layer_call_fn_3378733
'__inference_model_layer_call_fn_3378754
'__inference_model_layer_call_fn_3378639ż
ś˛˛
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 z4trace_0z5trace_1z6trace_2z7trace_3
˝
8trace_0
9trace_1
:trace_2
;trace_32Ň
B__inference_model_layer_call_and_return_conditional_losses_3378806
B__inference_model_layer_call_and_return_conditional_losses_3378858
B__inference_model_layer_call_and_return_conditional_losses_3378663
B__inference_model_layer_call_and_return_conditional_losses_3378687ż
ś˛˛
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 z8trace_0z9trace_1z:trace_2z;trace_3
ÍBĘ
"__inference__wrapped_model_3378397input_1"
˛
FullArgSpec
args 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 

<
_variables
=_iterations
>_learning_rate
?_index_dict
@
_momentums
A_velocities
B_update_step_xla"
experimentalOptimizer
,
Cserving_default"
signature_map
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
Dnon_trainable_variables

Elayers
Fmetrics
Glayer_regularization_losses
Hlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
ë
Itrace_02Î
'__inference_dense_layer_call_fn_3378867˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 zItrace_0

Jtrace_02é
B__inference_dense_layer_call_and_return_conditional_losses_3378885˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 zJtrace_0
 :
2dense/kernel
:2
dense/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
Knon_trainable_variables

Llayers
Mmetrics
Nlayer_regularization_losses
Olayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
í
Ptrace_02Đ
)__inference_dense_1_layer_call_fn_3378894˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 zPtrace_0

Qtrace_02ë
D__inference_dense_1_layer_call_and_return_conditional_losses_3378912˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 zQtrace_0
": 
2dense_1/kernel
:2dense_1/bias
.
%0
&1"
trackable_list_wrapper
.
%0
&1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
Rnon_trainable_variables

Slayers
Tmetrics
Ulayer_regularization_losses
Vlayer_metrics
	variables
 trainable_variables
!regularization_losses
#__call__
*$&call_and_return_all_conditional_losses
&$"call_and_return_conditional_losses"
_generic_user_object
í
Wtrace_02Đ
)__inference_dense_2_layer_call_fn_3378921˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 zWtrace_0

Xtrace_02ë
D__inference_dense_2_layer_call_and_return_conditional_losses_3378939˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 zXtrace_0
!:	@2dense_2/kernel
:@2dense_2/bias
.
-0
.1"
trackable_list_wrapper
.
-0
.1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
Ynon_trainable_variables

Zlayers
[metrics
\layer_regularization_losses
]layer_metrics
'	variables
(trainable_variables
)regularization_losses
+__call__
*,&call_and_return_all_conditional_losses
&,"call_and_return_conditional_losses"
_generic_user_object
í
^trace_02Đ
)__inference_dense_3_layer_call_fn_3378948˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 z^trace_0

_trace_02ë
D__inference_dense_3_layer_call_and_return_conditional_losses_3378958˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 z_trace_0
 :@2dense_3/kernel
:2dense_3/bias
 "
trackable_list_wrapper
C
0
1
2
3
4"
trackable_list_wrapper
'
`0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ůBö
'__inference_model_layer_call_fn_3378512input_1"ż
ś˛˛
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
řBő
'__inference_model_layer_call_fn_3378733inputs"ż
ś˛˛
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
řBő
'__inference_model_layer_call_fn_3378754inputs"ż
ś˛˛
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ůBö
'__inference_model_layer_call_fn_3378639input_1"ż
ś˛˛
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
B
B__inference_model_layer_call_and_return_conditional_losses_3378806inputs"ż
ś˛˛
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
B
B__inference_model_layer_call_and_return_conditional_losses_3378858inputs"ż
ś˛˛
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
B
B__inference_model_layer_call_and_return_conditional_losses_3378663input_1"ż
ś˛˛
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
B
B__inference_model_layer_call_and_return_conditional_losses_3378687input_1"ż
ś˛˛
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 

=0
a1
b2
c3
d4
e5
f6
g7
h8
i9
j10
k11
l12
m13
n14
o15
p16"
trackable_list_wrapper
:	 2	iteration
: 2learning_rate
 "
trackable_dict_wrapper
X
a0
c1
e2
g3
i4
k5
m6
o7"
trackable_list_wrapper
X
b0
d1
f2
h3
j4
l5
n6
p7"
trackable_list_wrapper
ż2źš
Ž˛Ş
FullArgSpec2
args*'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 0
ĚBÉ
%__inference_signature_wrapper_3378712input_1"
˛
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ŰBŘ
'__inference_dense_layer_call_fn_3378867inputs"˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
öBó
B__inference_dense_layer_call_and_return_conditional_losses_3378885inputs"˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ÝBÚ
)__inference_dense_1_layer_call_fn_3378894inputs"˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
řBő
D__inference_dense_1_layer_call_and_return_conditional_losses_3378912inputs"˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ÝBÚ
)__inference_dense_2_layer_call_fn_3378921inputs"˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
řBő
D__inference_dense_2_layer_call_and_return_conditional_losses_3378939inputs"˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ÝBÚ
)__inference_dense_3_layer_call_fn_3378948inputs"˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
řBő
D__inference_dense_3_layer_call_and_return_conditional_losses_3378958inputs"˘
˛
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
N
q	variables
r	keras_api
	stotal
	tcount"
_tf_keras_metric
%:#
2Adam/m/dense/kernel
%:#
2Adam/v/dense/kernel
:2Adam/m/dense/bias
:2Adam/v/dense/bias
':%
2Adam/m/dense_1/kernel
':%
2Adam/v/dense_1/kernel
 :2Adam/m/dense_1/bias
 :2Adam/v/dense_1/bias
&:$	@2Adam/m/dense_2/kernel
&:$	@2Adam/v/dense_2/kernel
:@2Adam/m/dense_2/bias
:@2Adam/v/dense_2/bias
%:#@2Adam/m/dense_3/kernel
%:#@2Adam/v/dense_3/kernel
:2Adam/m/dense_3/bias
:2Adam/v/dense_3/bias
.
s0
t1"
trackable_list_wrapper
-
q	variables"
_generic_user_object
:  (2total
:  (2count
PbN
beta:0D__inference_dense_2_layer_call_and_return_conditional_losses_3378939
SbQ
	BiasAdd:0D__inference_dense_2_layer_call_and_return_conditional_losses_3378939
PbN
beta:0D__inference_dense_2_layer_call_and_return_conditional_losses_3378470
SbQ
	BiasAdd:0D__inference_dense_2_layer_call_and_return_conditional_losses_3378470
PbN
beta:0D__inference_dense_1_layer_call_and_return_conditional_losses_3378912
SbQ
	BiasAdd:0D__inference_dense_1_layer_call_and_return_conditional_losses_3378912
PbN
beta:0D__inference_dense_1_layer_call_and_return_conditional_losses_3378446
SbQ
	BiasAdd:0D__inference_dense_1_layer_call_and_return_conditional_losses_3378446
NbL
beta:0B__inference_dense_layer_call_and_return_conditional_losses_3378885
QbO
	BiasAdd:0B__inference_dense_layer_call_and_return_conditional_losses_3378885
NbL
beta:0B__inference_dense_layer_call_and_return_conditional_losses_3378422
QbO
	BiasAdd:0B__inference_dense_layer_call_and_return_conditional_losses_3378422
TbR
dense/beta:0B__inference_model_layer_call_and_return_conditional_losses_3378858
WbU
dense/BiasAdd:0B__inference_model_layer_call_and_return_conditional_losses_3378858
VbT
dense_1/beta:0B__inference_model_layer_call_and_return_conditional_losses_3378858
YbW
dense_1/BiasAdd:0B__inference_model_layer_call_and_return_conditional_losses_3378858
VbT
dense_2/beta:0B__inference_model_layer_call_and_return_conditional_losses_3378858
YbW
dense_2/BiasAdd:0B__inference_model_layer_call_and_return_conditional_losses_3378858
TbR
dense/beta:0B__inference_model_layer_call_and_return_conditional_losses_3378806
WbU
dense/BiasAdd:0B__inference_model_layer_call_and_return_conditional_losses_3378806
VbT
dense_1/beta:0B__inference_model_layer_call_and_return_conditional_losses_3378806
YbW
dense_1/BiasAdd:0B__inference_model_layer_call_and_return_conditional_losses_3378806
VbT
dense_2/beta:0B__inference_model_layer_call_and_return_conditional_losses_3378806
YbW
dense_2/BiasAdd:0B__inference_model_layer_call_and_return_conditional_losses_3378806
:b8
model/dense/beta:0"__inference__wrapped_model_3378397
=b;
model/dense/BiasAdd:0"__inference__wrapped_model_3378397
<b:
model/dense_1/beta:0"__inference__wrapped_model_3378397
?b=
model/dense_1/BiasAdd:0"__inference__wrapped_model_3378397
<b:
model/dense_2/beta:0"__inference__wrapped_model_3378397
?b=
model/dense_2/BiasAdd:0"__inference__wrapped_model_3378397
"__inference__wrapped_model_3378397p%&-.1˘.
'˘$
"
input_1˙˙˙˙˙˙˙˙˙
Ş "1Ş.
,
dense_3!
dense_3˙˙˙˙˙˙˙˙˙­
D__inference_dense_1_layer_call_and_return_conditional_losses_3378912e0˘-
&˘#
!
inputs˙˙˙˙˙˙˙˙˙
Ş "-˘*
# 
tensor_0˙˙˙˙˙˙˙˙˙
 
)__inference_dense_1_layer_call_fn_3378894Z0˘-
&˘#
!
inputs˙˙˙˙˙˙˙˙˙
Ş ""
unknown˙˙˙˙˙˙˙˙˙Ź
D__inference_dense_2_layer_call_and_return_conditional_losses_3378939d%&0˘-
&˘#
!
inputs˙˙˙˙˙˙˙˙˙
Ş ",˘)
"
tensor_0˙˙˙˙˙˙˙˙˙@
 
)__inference_dense_2_layer_call_fn_3378921Y%&0˘-
&˘#
!
inputs˙˙˙˙˙˙˙˙˙
Ş "!
unknown˙˙˙˙˙˙˙˙˙@Ť
D__inference_dense_3_layer_call_and_return_conditional_losses_3378958c-./˘,
%˘"
 
inputs˙˙˙˙˙˙˙˙˙@
Ş ",˘)
"
tensor_0˙˙˙˙˙˙˙˙˙
 
)__inference_dense_3_layer_call_fn_3378948X-./˘,
%˘"
 
inputs˙˙˙˙˙˙˙˙˙@
Ş "!
unknown˙˙˙˙˙˙˙˙˙Ť
B__inference_dense_layer_call_and_return_conditional_losses_3378885e0˘-
&˘#
!
inputs˙˙˙˙˙˙˙˙˙
Ş "-˘*
# 
tensor_0˙˙˙˙˙˙˙˙˙
 
'__inference_dense_layer_call_fn_3378867Z0˘-
&˘#
!
inputs˙˙˙˙˙˙˙˙˙
Ş ""
unknown˙˙˙˙˙˙˙˙˙Á
$__inference_internal_grad_fn_3379035uve˘b
[˘X

 
(%
result_grads_0˙˙˙˙˙˙˙˙˙@
(%
result_grads_1˙˙˙˙˙˙˙˙˙@
Ş "+(

 
"
tensor_1˙˙˙˙˙˙˙˙˙@Á
$__inference_internal_grad_fn_3379053wxe˘b
[˘X

 
(%
result_grads_0˙˙˙˙˙˙˙˙˙@
(%
result_grads_1˙˙˙˙˙˙˙˙˙@
Ş "+(

 
"
tensor_1˙˙˙˙˙˙˙˙˙@Ä
$__inference_internal_grad_fn_3379071yzg˘d
]˘Z

 
)&
result_grads_0˙˙˙˙˙˙˙˙˙
)&
result_grads_1˙˙˙˙˙˙˙˙˙
Ş ",)

 
# 
tensor_1˙˙˙˙˙˙˙˙˙Ä
$__inference_internal_grad_fn_3379089{|g˘d
]˘Z

 
)&
result_grads_0˙˙˙˙˙˙˙˙˙
)&
result_grads_1˙˙˙˙˙˙˙˙˙
Ş ",)

 
# 
tensor_1˙˙˙˙˙˙˙˙˙Ä
$__inference_internal_grad_fn_3379107}~g˘d
]˘Z

 
)&
result_grads_0˙˙˙˙˙˙˙˙˙
)&
result_grads_1˙˙˙˙˙˙˙˙˙
Ş ",)

 
# 
tensor_1˙˙˙˙˙˙˙˙˙Ĺ
$__inference_internal_grad_fn_3379125g˘d
]˘Z

 
)&
result_grads_0˙˙˙˙˙˙˙˙˙
)&
result_grads_1˙˙˙˙˙˙˙˙˙
Ş ",)

 
# 
tensor_1˙˙˙˙˙˙˙˙˙Ć
$__inference_internal_grad_fn_3379143g˘d
]˘Z

 
)&
result_grads_0˙˙˙˙˙˙˙˙˙
)&
result_grads_1˙˙˙˙˙˙˙˙˙
Ş ",)

 
# 
tensor_1˙˙˙˙˙˙˙˙˙Ć
$__inference_internal_grad_fn_3379161g˘d
]˘Z

 
)&
result_grads_0˙˙˙˙˙˙˙˙˙
)&
result_grads_1˙˙˙˙˙˙˙˙˙
Ş ",)

 
# 
tensor_1˙˙˙˙˙˙˙˙˙Ă
$__inference_internal_grad_fn_3379179e˘b
[˘X

 
(%
result_grads_0˙˙˙˙˙˙˙˙˙@
(%
result_grads_1˙˙˙˙˙˙˙˙˙@
Ş "+(

 
"
tensor_1˙˙˙˙˙˙˙˙˙@Ć
$__inference_internal_grad_fn_3379197g˘d
]˘Z

 
)&
result_grads_0˙˙˙˙˙˙˙˙˙
)&
result_grads_1˙˙˙˙˙˙˙˙˙
Ş ",)

 
# 
tensor_1˙˙˙˙˙˙˙˙˙Ć
$__inference_internal_grad_fn_3379215g˘d
]˘Z

 
)&
result_grads_0˙˙˙˙˙˙˙˙˙
)&
result_grads_1˙˙˙˙˙˙˙˙˙
Ş ",)

 
# 
tensor_1˙˙˙˙˙˙˙˙˙Ă
$__inference_internal_grad_fn_3379233e˘b
[˘X

 
(%
result_grads_0˙˙˙˙˙˙˙˙˙@
(%
result_grads_1˙˙˙˙˙˙˙˙˙@
Ş "+(

 
"
tensor_1˙˙˙˙˙˙˙˙˙@Ć
$__inference_internal_grad_fn_3379251g˘d
]˘Z

 
)&
result_grads_0˙˙˙˙˙˙˙˙˙
)&
result_grads_1˙˙˙˙˙˙˙˙˙
Ş ",)

 
# 
tensor_1˙˙˙˙˙˙˙˙˙Ć
$__inference_internal_grad_fn_3379269g˘d
]˘Z

 
)&
result_grads_0˙˙˙˙˙˙˙˙˙
)&
result_grads_1˙˙˙˙˙˙˙˙˙
Ş ",)

 
# 
tensor_1˙˙˙˙˙˙˙˙˙Ă
$__inference_internal_grad_fn_3379287e˘b
[˘X

 
(%
result_grads_0˙˙˙˙˙˙˙˙˙@
(%
result_grads_1˙˙˙˙˙˙˙˙˙@
Ş "+(

 
"
tensor_1˙˙˙˙˙˙˙˙˙@š
B__inference_model_layer_call_and_return_conditional_losses_3378663s%&-.9˘6
/˘,
"
input_1˙˙˙˙˙˙˙˙˙
p 

 
Ş ",˘)
"
tensor_0˙˙˙˙˙˙˙˙˙
 š
B__inference_model_layer_call_and_return_conditional_losses_3378687s%&-.9˘6
/˘,
"
input_1˙˙˙˙˙˙˙˙˙
p

 
Ş ",˘)
"
tensor_0˙˙˙˙˙˙˙˙˙
 ¸
B__inference_model_layer_call_and_return_conditional_losses_3378806r%&-.8˘5
.˘+
!
inputs˙˙˙˙˙˙˙˙˙
p 

 
Ş ",˘)
"
tensor_0˙˙˙˙˙˙˙˙˙
 ¸
B__inference_model_layer_call_and_return_conditional_losses_3378858r%&-.8˘5
.˘+
!
inputs˙˙˙˙˙˙˙˙˙
p

 
Ş ",˘)
"
tensor_0˙˙˙˙˙˙˙˙˙
 
'__inference_model_layer_call_fn_3378512h%&-.9˘6
/˘,
"
input_1˙˙˙˙˙˙˙˙˙
p 

 
Ş "!
unknown˙˙˙˙˙˙˙˙˙
'__inference_model_layer_call_fn_3378639h%&-.9˘6
/˘,
"
input_1˙˙˙˙˙˙˙˙˙
p

 
Ş "!
unknown˙˙˙˙˙˙˙˙˙
'__inference_model_layer_call_fn_3378733g%&-.8˘5
.˘+
!
inputs˙˙˙˙˙˙˙˙˙
p 

 
Ş "!
unknown˙˙˙˙˙˙˙˙˙
'__inference_model_layer_call_fn_3378754g%&-.8˘5
.˘+
!
inputs˙˙˙˙˙˙˙˙˙
p

 
Ş "!
unknown˙˙˙˙˙˙˙˙˙¤
%__inference_signature_wrapper_3378712{%&-.<˘9
˘ 
2Ş/
-
input_1"
input_1˙˙˙˙˙˙˙˙˙"1Ş.
,
dense_3!
dense_3˙˙˙˙˙˙˙˙˙