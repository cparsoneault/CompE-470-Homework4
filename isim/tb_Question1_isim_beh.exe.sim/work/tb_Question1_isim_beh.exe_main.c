/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001931221845_0892944663_init();
    work_m_00000000000014299773_2525760129_init();
    work_m_00000000000014299773_0976831885_init();
    work_m_00000000001931221845_2576092699_init();
    work_m_00000000000014299773_2750105897_init();
    work_m_00000000001438935959_0079977699_init();
    work_m_00000000002402926863_0337110866_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002402926863_0337110866");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
