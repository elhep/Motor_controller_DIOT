/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_550(char*, char *);
IKI_DLLESPEC extern void execute_551(char*, char *);
IKI_DLLESPEC extern void execute_552(char*, char *);
IKI_DLLESPEC extern void execute_553(char*, char *);
IKI_DLLESPEC extern void execute_554(char*, char *);
IKI_DLLESPEC extern void execute_555(char*, char *);
IKI_DLLESPEC extern void execute_556(char*, char *);
IKI_DLLESPEC extern void execute_557(char*, char *);
IKI_DLLESPEC extern void execute_558(char*, char *);
IKI_DLLESPEC extern void execute_559(char*, char *);
IKI_DLLESPEC extern void execute_560(char*, char *);
IKI_DLLESPEC extern void execute_561(char*, char *);
IKI_DLLESPEC extern void execute_126(char*, char *);
IKI_DLLESPEC extern void execute_176(char*, char *);
IKI_DLLESPEC extern void execute_497(char*, char *);
IKI_DLLESPEC extern void execute_498(char*, char *);
IKI_DLLESPEC extern void execute_506(char*, char *);
IKI_DLLESPEC extern void execute_514(char*, char *);
IKI_DLLESPEC extern void execute_515(char*, char *);
IKI_DLLESPEC extern void execute_124(char*, char *);
IKI_DLLESPEC extern void execute_181(char*, char *);
IKI_DLLESPEC extern void execute_183(char*, char *);
IKI_DLLESPEC extern void execute_208(char*, char *);
IKI_DLLESPEC extern void execute_186(char*, char *);
IKI_DLLESPEC extern void execute_187(char*, char *);
IKI_DLLESPEC extern void execute_211(char*, char *);
IKI_DLLESPEC extern void execute_215(char*, char *);
IKI_DLLESPEC extern void execute_225(char*, char *);
IKI_DLLESPEC extern void execute_221(char*, char *);
IKI_DLLESPEC extern void execute_222(char*, char *);
IKI_DLLESPEC extern void execute_504(char*, char *);
IKI_DLLESPEC extern void execute_501(char*, char *);
IKI_DLLESPEC extern void execute_502(char*, char *);
IKI_DLLESPEC extern void execute_510(char*, char *);
IKI_DLLESPEC extern void execute_511(char*, char *);
IKI_DLLESPEC extern void execute_512(char*, char *);
IKI_DLLESPEC extern void execute_144(char*, char *);
IKI_DLLESPEC extern void execute_145(char*, char *);
IKI_DLLESPEC extern void execute_151(char*, char *);
IKI_DLLESPEC extern void execute_135(char*, char *);
IKI_DLLESPEC extern void execute_141(char*, char *);
IKI_DLLESPEC extern void execute_142(char*, char *);
IKI_DLLESPEC extern void execute_139(char*, char *);
IKI_DLLESPEC extern void execute_147(char*, char *);
IKI_DLLESPEC extern void execute_149(char*, char *);
IKI_DLLESPEC extern void execute_204(char*, char *);
IKI_DLLESPEC extern void execute_205(char*, char *);
IKI_DLLESPEC extern void execute_207(char*, char *);
IKI_DLLESPEC extern void execute_195(char*, char *);
IKI_DLLESPEC extern void execute_201(char*, char *);
IKI_DLLESPEC extern void execute_202(char*, char *);
IKI_DLLESPEC extern void execute_199(char*, char *);
IKI_DLLESPEC extern void execute_234(char*, char *);
IKI_DLLESPEC extern void execute_490(char*, char *);
IKI_DLLESPEC extern void execute_491(char*, char *);
IKI_DLLESPEC extern void execute_238(char*, char *);
IKI_DLLESPEC extern void execute_240(char*, char *);
IKI_DLLESPEC extern void execute_280(char*, char *);
IKI_DLLESPEC extern void execute_282(char*, char *);
IKI_DLLESPEC extern void execute_283(char*, char *);
IKI_DLLESPEC extern void execute_357(char*, char *);
IKI_DLLESPEC extern void execute_366(char*, char *);
IKI_DLLESPEC extern void execute_373(char*, char *);
IKI_DLLESPEC extern void execute_385(char*, char *);
IKI_DLLESPEC extern void execute_460(char*, char *);
IKI_DLLESPEC extern void execute_461(char*, char *);
IKI_DLLESPEC extern void execute_476(char*, char *);
IKI_DLLESPEC extern void execute_459(char*, char *);
IKI_DLLESPEC extern void execute_464(char*, char *);
IKI_DLLESPEC extern void execute_465(char*, char *);
IKI_DLLESPEC extern void execute_246(char*, char *);
IKI_DLLESPEC extern void execute_247(char*, char *);
IKI_DLLESPEC extern void execute_248(char*, char *);
IKI_DLLESPEC extern void execute_254(char*, char *);
IKI_DLLESPEC extern void execute_272(char*, char *);
IKI_DLLESPEC extern void execute_273(char*, char *);
IKI_DLLESPEC extern void execute_275(char*, char *);
IKI_DLLESPEC extern void execute_263(char*, char *);
IKI_DLLESPEC extern void execute_269(char*, char *);
IKI_DLLESPEC extern void execute_270(char*, char *);
IKI_DLLESPEC extern void execute_267(char*, char *);
IKI_DLLESPEC extern void execute_304(char*, char *);
IKI_DLLESPEC extern void execute_295(char*, char *);
IKI_DLLESPEC extern void execute_296(char*, char *);
IKI_DLLESPEC extern void execute_300(char*, char *);
IKI_DLLESPEC extern void execute_307(char*, char *);
IKI_DLLESPEC extern void execute_340(char*, char *);
IKI_DLLESPEC extern void execute_342(char*, char *);
IKI_DLLESPEC extern void execute_343(char*, char *);
IKI_DLLESPEC extern void execute_311(char*, char *);
IKI_DLLESPEC extern void execute_316(char*, char *);
IKI_DLLESPEC extern void execute_334(char*, char *);
IKI_DLLESPEC extern void execute_335(char*, char *);
IKI_DLLESPEC extern void execute_337(char*, char *);
IKI_DLLESPEC extern void execute_325(char*, char *);
IKI_DLLESPEC extern void execute_331(char*, char *);
IKI_DLLESPEC extern void execute_332(char*, char *);
IKI_DLLESPEC extern void execute_329(char*, char *);
IKI_DLLESPEC extern void execute_347(char*, char *);
IKI_DLLESPEC extern void execute_348(char*, char *);
IKI_DLLESPEC extern void execute_349(char*, char *);
IKI_DLLESPEC extern void execute_362(char*, char *);
IKI_DLLESPEC extern void execute_410(char*, char *);
IKI_DLLESPEC extern void execute_396(char*, char *);
IKI_DLLESPEC extern void execute_399(char*, char *);
IKI_DLLESPEC extern void execute_421(char*, char *);
IKI_DLLESPEC extern void execute_422(char*, char *);
IKI_DLLESPEC extern void execute_442(char*, char *);
IKI_DLLESPEC extern void execute_443(char*, char *);
IKI_DLLESPEC extern void execute_405(char*, char *);
IKI_DLLESPEC extern void execute_414(char*, char *);
IKI_DLLESPEC extern void execute_426(char*, char *);
IKI_DLLESPEC extern void execute_427(char*, char *);
IKI_DLLESPEC extern void execute_431(char*, char *);
IKI_DLLESPEC extern void execute_482(char*, char *);
IKI_DLLESPEC extern void execute_530(char*, char *);
IKI_DLLESPEC extern void execute_531(char*, char *);
IKI_DLLESPEC extern void execute_532(char*, char *);
IKI_DLLESPEC extern void execute_533(char*, char *);
IKI_DLLESPEC extern void execute_534(char*, char *);
IKI_DLLESPEC extern void execute_535(char*, char *);
IKI_DLLESPEC extern void execute_536(char*, char *);
IKI_DLLESPEC extern void execute_537(char*, char *);
IKI_DLLESPEC extern void execute_538(char*, char *);
IKI_DLLESPEC extern void execute_539(char*, char *);
IKI_DLLESPEC extern void execute_540(char*, char *);
IKI_DLLESPEC extern void execute_541(char*, char *);
IKI_DLLESPEC extern void execute_542(char*, char *);
IKI_DLLESPEC extern void execute_543(char*, char *);
IKI_DLLESPEC extern void execute_544(char*, char *);
IKI_DLLESPEC extern void execute_545(char*, char *);
IKI_DLLESPEC extern void execute_546(char*, char *);
IKI_DLLESPEC extern void execute_547(char*, char *);
IKI_DLLESPEC extern void execute_548(char*, char *);
IKI_DLLESPEC extern void execute_549(char*, char *);
IKI_DLLESPEC extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_63(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_64(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_67(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_68(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_74(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_75(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_78(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_79(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_80(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_87(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_101(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_105(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_112(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_121(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_248(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_265(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_266(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[155] = {(funcp)execute_550, (funcp)execute_551, (funcp)execute_552, (funcp)execute_553, (funcp)execute_554, (funcp)execute_555, (funcp)execute_556, (funcp)execute_557, (funcp)execute_558, (funcp)execute_559, (funcp)execute_560, (funcp)execute_561, (funcp)execute_126, (funcp)execute_176, (funcp)execute_497, (funcp)execute_498, (funcp)execute_506, (funcp)execute_514, (funcp)execute_515, (funcp)execute_124, (funcp)execute_181, (funcp)execute_183, (funcp)execute_208, (funcp)execute_186, (funcp)execute_187, (funcp)execute_211, (funcp)execute_215, (funcp)execute_225, (funcp)execute_221, (funcp)execute_222, (funcp)execute_504, (funcp)execute_501, (funcp)execute_502, (funcp)execute_510, (funcp)execute_511, (funcp)execute_512, (funcp)execute_144, (funcp)execute_145, (funcp)execute_151, (funcp)execute_135, (funcp)execute_141, (funcp)execute_142, (funcp)execute_139, (funcp)execute_147, (funcp)execute_149, (funcp)execute_204, (funcp)execute_205, (funcp)execute_207, (funcp)execute_195, (funcp)execute_201, (funcp)execute_202, (funcp)execute_199, (funcp)execute_234, (funcp)execute_490, (funcp)execute_491, (funcp)execute_238, (funcp)execute_240, (funcp)execute_280, (funcp)execute_282, (funcp)execute_283, (funcp)execute_357, (funcp)execute_366, (funcp)execute_373, (funcp)execute_385, (funcp)execute_460, (funcp)execute_461, (funcp)execute_476, (funcp)execute_459, (funcp)execute_464, (funcp)execute_465, (funcp)execute_246, (funcp)execute_247, (funcp)execute_248, (funcp)execute_254, (funcp)execute_272, (funcp)execute_273, (funcp)execute_275, (funcp)execute_263, (funcp)execute_269, (funcp)execute_270, (funcp)execute_267, (funcp)execute_304, (funcp)execute_295, (funcp)execute_296, (funcp)execute_300, (funcp)execute_307, (funcp)execute_340, (funcp)execute_342, (funcp)execute_343, (funcp)execute_311, (funcp)execute_316, (funcp)execute_334, (funcp)execute_335, (funcp)execute_337, (funcp)execute_325, (funcp)execute_331, (funcp)execute_332, (funcp)execute_329, (funcp)execute_347, (funcp)execute_348, (funcp)execute_349, (funcp)execute_362, (funcp)execute_410, (funcp)execute_396, (funcp)execute_399, (funcp)execute_421, (funcp)execute_422, (funcp)execute_442, (funcp)execute_443, (funcp)execute_405, (funcp)execute_414, (funcp)execute_426, (funcp)execute_427, (funcp)execute_431, (funcp)execute_482, (funcp)execute_530, (funcp)execute_531, (funcp)execute_532, (funcp)execute_533, (funcp)execute_534, (funcp)execute_535, (funcp)execute_536, (funcp)execute_537, (funcp)execute_538, (funcp)execute_539, (funcp)execute_540, (funcp)execute_541, (funcp)execute_542, (funcp)execute_543, (funcp)execute_544, (funcp)execute_545, (funcp)execute_546, (funcp)execute_547, (funcp)execute_548, (funcp)execute_549, (funcp)transaction_0, (funcp)transaction_1, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_63, (funcp)transaction_64, (funcp)transaction_67, (funcp)transaction_68, (funcp)transaction_74, (funcp)transaction_75, (funcp)transaction_78, (funcp)transaction_79, (funcp)transaction_80, (funcp)transaction_87, (funcp)transaction_101, (funcp)transaction_105, (funcp)transaction_112, (funcp)transaction_121, (funcp)transaction_248, (funcp)transaction_265, (funcp)transaction_266};
const int NumRelocateId= 155;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_dds_compiler_0_behav/xsim.reloc",  (void **)funcTab, 155);
	iki_vhdl_file_variable_register(dp + 105864);
	iki_vhdl_file_variable_register(dp + 105920);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_dds_compiler_0_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_dds_compiler_0_behav/xsim.reloc");

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_xsimdir_location_if_remapped(argc, argv)  ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_dds_compiler_0_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_dds_compiler_0_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_dds_compiler_0_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
