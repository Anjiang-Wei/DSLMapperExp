Task * GPU,OMP,CPU;
Region * * GPU FBMEM;
Region * * * SOCKMEM,SYSMEM;
Layout * * * C_order SOA;
m = Machine(GPU).merge(0,1);
def cyclic_mapping(Task task) {
    return m[task.ipoint[0] % m.size[0]];
}
def block_mapping(Task task) {
    return m[task.ipoint[0] * m.size[0] / task.ispace[0]];
}
IndexTaskMap task_1,task_2,task_3,task_4 block_mapping;
