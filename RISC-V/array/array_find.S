/* ---------------------------------------------------------------------------------------------------------------
*
*  int array_find(TYPE *array, size_t const start, size_t const end, TYPE const value);
*
*  find the first occurrence of a value in the array by linear search
*
--------------------------------------------------------------------------------------------------------------- */


# array_find_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_find_int
    .type array_find_int, @function
    .text


    array_find_int:

        # check the indexes
        bgt     a1, a2, end_array_find_int

        # load start
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # load &array[start]
        add     t0, a0, a1

        # go to the loop
        j       loop_array_find_int
        

    loop_array_find_int:

        # while (i <= end)
        bgt     a1, a2, end_array_find_int
            
        # load array[i]
        lw      t1, 0(t0)
        addi    t0, t0, 4

        # i++
        addi    a1, a1, 4

        # compare array[i] with value
        bne     t1, a3, loop_array_find_int

        # value found --> return i
        mv      a0, a1
        addi    a0, a0, -4
        srai    a0, a0, 2
        ret
        

    end_array_find_int:

        # value not found --> return -1
        li      a0, -1
        ret

#endif // INT_TYPE


# array_find_float()
/* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global array_find_float
    .type array_find_float, @function
    .text


    array_find_float:

        # check the indexes
        bgt     a1, a2, end_array_find_float

        # load start
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # load &array[start]
        add     t0, a0, a1

        # go to the loop
        j       loop_array_find_float
        

    loop_array_find_float:

        # while (i <= end)
        bgt     a1, a2, end_array_find_float
            
        # load array[i]
        flw     ft0, 0(t0)
        addi    t0, t0, 4

        # i++
        addi    a1, a1, 4

        # compare array[i] with value
        feq.s   t1, ft0, fa0
        beq     t1, zero, loop_array_find_float            

        # value found --> return i
        mv      a0, a1
        addi    a0, a0, -4
        srai    a0, a0, 2
        ret
        

    end_array_find_float:

        # value not found --> return -1
        li      a0, -1
        ret

#endif // FLOAT_TYPE