; ModuleID = '../data/hip_kernels/16034/62/main.cu'
source_filename = "../data/hip_kernels/16034/62/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_normcdf(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %137

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp ogt double %36, 0x40434D4EDCE2B7D6
  %38 = tail call double @llvm.copysign.f64(double 0x40434D4EDCE2B7D6, double %35)
  %39 = select i1 %37, double %38, double %35
  %40 = fmul double %39, 0xBFE6A09E667F3BCD
  %41 = fneg double %40
  %42 = tail call double @llvm.fma.f64(double %39, double 0xBFE6A09E667F3BCD, double %41)
  %43 = tail call double @llvm.fma.f64(double %39, double 0x3C8BDD3413B26456, double %42)
  %44 = fadd double %40, %43
  %45 = fsub double %44, %40
  %46 = fsub double %43, %45
  %47 = tail call double @llvm.fabs.f64(double %44)
  %48 = fneg double %44
  %49 = fmul double %44, %48
  %50 = fneg double %49
  %51 = tail call double @llvm.fma.f64(double %48, double %44, double %50)
  %52 = fmul double %49, 0x3FF71547652B82FE
  %53 = tail call double @llvm.rint.f64(double %52)
  %54 = fneg double %53
  %55 = tail call double @llvm.fma.f64(double %54, double 0x3FE62E42FEFA39EF, double %49)
  %56 = tail call double @llvm.fma.f64(double %54, double 0x3C7ABC9E3B39803F, double %55)
  %57 = tail call double @llvm.fma.f64(double %56, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %58 = tail call double @llvm.fma.f64(double %56, double %57, double 0x3EC71DEE623FDE64)
  %59 = tail call double @llvm.fma.f64(double %56, double %58, double 0x3EFA01997C89E6B0)
  %60 = tail call double @llvm.fma.f64(double %56, double %59, double 0x3F2A01A014761F6E)
  %61 = tail call double @llvm.fma.f64(double %56, double %60, double 0x3F56C16C1852B7B0)
  %62 = tail call double @llvm.fma.f64(double %56, double %61, double 0x3F81111111122322)
  %63 = tail call double @llvm.fma.f64(double %56, double %62, double 0x3FA55555555502A1)
  %64 = tail call double @llvm.fma.f64(double %56, double %63, double 0x3FC5555555555511)
  %65 = tail call double @llvm.fma.f64(double %56, double %64, double 0x3FE000000000000B)
  %66 = tail call double @llvm.fma.f64(double %56, double %65, double 1.000000e+00)
  %67 = tail call double @llvm.fma.f64(double %56, double %66, double 1.000000e+00)
  %68 = fptosi double %53 to i32
  %69 = tail call double @llvm.amdgcn.ldexp.f64(double %67, i32 %68)
  %70 = fcmp ogt double %49, 1.024000e+03
  %71 = select i1 %70, double 0x7FF0000000000000, double %69
  %72 = fcmp olt double %49, -1.075000e+03
  %73 = select i1 %72, double 0.000000e+00, double %71
  %74 = tail call double @llvm.fma.f64(double %73, double %51, double %73)
  %75 = fadd double %47, -4.000000e+00
  %76 = fadd double %47, 4.000000e+00
  %77 = tail call double @llvm.amdgcn.rcp.f64(double %76)
  %78 = fneg double %76
  %79 = tail call double @llvm.fma.f64(double %78, double %77, double 1.000000e+00)
  %80 = tail call double @llvm.fma.f64(double %79, double %77, double %77)
  %81 = tail call double @llvm.fma.f64(double %78, double %80, double 1.000000e+00)
  %82 = tail call double @llvm.fma.f64(double %81, double %80, double %80)
  %83 = fmul double %75, %82
  %84 = fneg double %83
  %85 = fadd double %83, 1.000000e+00
  %86 = tail call double @llvm.fma.f64(double %85, double -4.000000e+00, double %47)
  %87 = tail call double @llvm.fma.f64(double %84, double %47, double %86)
  %88 = tail call double @llvm.fma.f64(double %82, double %87, double %83)
  %89 = tail call double @llvm.fma.f64(double %88, double 0xBE41F39D54DF3C0E, double 0xBE41166337CFA789)
  %90 = tail call double @llvm.fma.f64(double %88, double %89, double 0x3E7B45F1D9802B82)
  %91 = tail call double @llvm.fma.f64(double %88, double %90, double 0x3E6D90488A03DCDB)
  %92 = tail call double @llvm.fma.f64(double %88, double %91, double 0xBEAB87B02EBA62D8)
  %93 = tail call double @llvm.fma.f64(double %88, double %92, double 0x3E95104BA56E15F1)
  %94 = tail call double @llvm.fma.f64(double %88, double %93, double 0x3ED7F29F71C907DE)
  %95 = tail call double @llvm.fma.f64(double %88, double %94, double 0xBEE78F5C2CD770FB)
  %96 = tail call double @llvm.fma.f64(double %88, double %95, double 0xBEF995FB76D0A51A)
  %97 = tail call double @llvm.fma.f64(double %88, double %96, double 0x3F23BE2EC022D0ED)
  %98 = tail call double @llvm.fma.f64(double %88, double %97, double 0xBF2A1DEB2FDBF62E)
  %99 = tail call double @llvm.fma.f64(double %88, double %98, double 0xBF48D4AC3689FC43)
  %100 = tail call double @llvm.fma.f64(double %88, double %99, double 0x3F749C67192D909B)
  %101 = tail call double @llvm.fma.f64(double %88, double %100, double 0xBF909623852FF070)
  %102 = tail call double @llvm.fma.f64(double %88, double %101, double 0x3FA3079EDFADEA8F)
  %103 = tail call double @llvm.fma.f64(double %88, double %102, double 0xBFB0FB06DFF65910)
  %104 = tail call double @llvm.fma.f64(double %88, double %103, double 0x3FB7FEE004DE8F32)
  %105 = tail call double @llvm.fma.f64(double %88, double %104, double 0xBFB9DDB23C3DBEB3)
  %106 = tail call double @llvm.fma.f64(double %88, double %105, double 0x3FB16ECEFCFA6930)
  %107 = tail call double @llvm.fma.f64(double %88, double %106, double 0x3F8F7F5DF66FB8A3)
  %108 = tail call double @llvm.fma.f64(double %88, double %107, double 0xBFC1DF1AD154A2A8)
  %109 = tail call double @llvm.fma.f64(double %88, double %108, double 0x3FCDD2C8B74FEBF8)
  %110 = fadd double %47, %47
  %111 = fadd double %110, 1.000000e+00
  %112 = tail call double @llvm.amdgcn.rcp.f64(double %111)
  %113 = fneg double %111
  %114 = tail call double @llvm.fma.f64(double %113, double %112, double 1.000000e+00)
  %115 = tail call double @llvm.fma.f64(double %114, double %112, double %112)
  %116 = tail call double @llvm.fma.f64(double %113, double %115, double 1.000000e+00)
  %117 = tail call double @llvm.fma.f64(double %116, double %115, double %115)
  %118 = tail call double @llvm.fma.f64(double %109, double %117, double %117)
  %119 = fneg double %118
  %120 = tail call double @llvm.fma.f64(double %119, double %110, double 1.000000e+00)
  %121 = fsub double %109, %118
  %122 = fadd double %120, %121
  %123 = tail call double @llvm.fma.f64(double %117, double %122, double %118)
  %124 = fmul double %74, %123
  %125 = fcmp ogt double %47, 0x403B39DC41E48BFC
  %126 = select i1 %125, double 0.000000e+00, double %124
  %127 = fsub double 2.000000e+00, %126
  %128 = fcmp olt double %44, 0.000000e+00
  %129 = select i1 %128, double %127, double %126
  %130 = fmul double %44, -2.000000e+00
  %131 = fmul double %130, %129
  %132 = fcmp oge double %39, -1.000000e+00
  %133 = select i1 %132, double 0.000000e+00, double %131
  %134 = tail call double @llvm.fma.f64(double %46, double %133, double %129)
  %135 = fmul double %134, 5.000000e-01
  %136 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %135, double addrspace(1)* %136, align 8, !tbaa !16
  br label %137

137:                                              ; preds = %32, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
