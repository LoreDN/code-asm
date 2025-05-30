/* ---------------------------------------------------------------------------------------------------------------
*
*  TYPE array_sum(TYPE *array, size_t const start, size_t const end);
*
*  get the sum of the elements of the array
*
--------------------------------------------------------------------------------------------------------------- */


# array_sum_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_sum_int
    .type array_sum_int, @function
    .text


    array_sum_int:

        # load &array
        mv      t0, a0

        # load zero
        li      a0, 0

        # check indexes
        bgt     a1, a2, end_array_sum_int

        # load start
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # get the sum
        add     t0, t0, a1
        lw      a0, 0(t0)
        addi    a1, a1, 4

        # go to the loop
        j       loop_array_sum_int
        

    loop_array_sum_int:

        # while (i <= end)
        bgt     a1, a2, end_array_sum_int

        # sum += array[i]
        addi    t0, t0, 4
        lw      t1, 0(t0)
        add     a0, a0, t1

        # i++
        addi    a1, a1, 4

        # go to the loop
        j       loop_array_sum_int

        
    end_array_sum_int:

        # return the sum
        ret

#endif // INT_TYPE


# array_sum_float()
/* ========================== FLOAT ========================== */
#ifdef FLOAT_TYPE

    .global array_sum_float
    .type array_sum_float, @function
    .text


    array_sum_float:

        # load zero
        fmv.w.x      fa0, zero

        # check indexes
        bgt     a1, a2, end_array_sum_float

        # load start
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # get the sum
        add     a0, a0, a1
        flw     fa0, 0(a0)
        addi    a1, a1, 4

        # go to the loop
        j       loop_array_sum_float
        

    loop_array_sum_float:

        # while (i <= end)
        bgt     a1, a2, end_array_sum_float

        # sum += array[i]
        addi    a0, a0, 4
        flw     ft0, 0(a0)
        fadd.s  fa0, fa0, ft0

        # i++
        addi    a1, a1, 4

        # go to the loop
        j       loop_array_sum_float
        

    end_array_sum_float:

        # return the sum
        ret

#endif // FLOAT_TYPE