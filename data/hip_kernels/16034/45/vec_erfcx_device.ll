; ModuleID = '../data/hip_kernels/16034/45/main.cu'
source_filename = "../data/hip_kernels/16034/45/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_erfcx(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %133

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp olt double %36, 0x403B39DC41E48BFC
  br i1 %37, label %38, label %88

38:                                               ; preds = %32
  %39 = fadd double %36, -4.000000e+00
  %40 = fadd double %36, 4.000000e+00
  %41 = tail call double @llvm.amdgcn.rcp.f64(double %40)
  %42 = fneg double %40
  %43 = tail call double @llvm.fma.f64(double %42, double %41, double 1.000000e+00)
  %44 = tail call double @llvm.fma.f64(double %43, double %41, double %41)
  %45 = tail call double @llvm.fma.f64(double %42, double %44, double 1.000000e+00)
  %46 = tail call double @llvm.fma.f64(double %45, double %44, double %44)
  %47 = fmul double %39, %46
  %48 = fneg double %47
  %49 = fadd double %47, 1.000000e+00
  %50 = tail call double @llvm.fma.f64(double %49, double -4.000000e+00, double %36)
  %51 = tail call double @llvm.fma.f64(double %48, double %36, double %50)
  %52 = tail call double @llvm.fma.f64(double %46, double %51, double %47)
  %53 = tail call double @llvm.fma.f64(double %52, double 0xBE41F39D54DF3C0E, double 0xBE41166337CFA789)
  %54 = tail call double @llvm.fma.f64(double %52, double %53, double 0x3E7B45F1D9802B82)
  %55 = tail call double @llvm.fma.f64(double %52, double %54, double 0x3E6D90488A03DCDB)
  %56 = tail call double @llvm.fma.f64(double %52, double %55, double 0xBEAB87B02EBA62D8)
  %57 = tail call double @llvm.fma.f64(double %52, double %56, double 0x3E95104BA56E15F1)
  %58 = tail call double @llvm.fma.f64(double %52, double %57, double 0x3ED7F29F71C907DE)
  %59 = tail call double @llvm.fma.f64(double %52, double %58, double 0xBEE78F5C2CD770FB)
  %60 = tail call double @llvm.fma.f64(double %52, double %59, double 0xBEF995FB76D0A51A)
  %61 = tail call double @llvm.fma.f64(double %52, double %60, double 0x3F23BE2EC022D0ED)
  %62 = tail call double @llvm.fma.f64(double %52, double %61, double 0xBF2A1DEB2FDBF62E)
  %63 = tail call double @llvm.fma.f64(double %52, double %62, double 0xBF48D4AC3689FC43)
  %64 = tail call double @llvm.fma.f64(double %52, double %63, double 0x3F749C67192D909B)
  %65 = tail call double @llvm.fma.f64(double %52, double %64, double 0xBF909623852FF070)
  %66 = tail call double @llvm.fma.f64(double %52, double %65, double 0x3FA3079EDFADEA8F)
  %67 = tail call double @llvm.fma.f64(double %52, double %66, double 0xBFB0FB06DFF65910)
  %68 = tail call double @llvm.fma.f64(double %52, double %67, double 0x3FB7FEE004DE8F32)
  %69 = tail call double @llvm.fma.f64(double %52, double %68, double 0xBFB9DDB23C3DBEB3)
  %70 = tail call double @llvm.fma.f64(double %52, double %69, double 0x3FB16ECEFCFA6930)
  %71 = tail call double @llvm.fma.f64(double %52, double %70, double 0x3F8F7F5DF66FB8A3)
  %72 = tail call double @llvm.fma.f64(double %52, double %71, double 0xBFC1DF1AD154A2A8)
  %73 = tail call double @llvm.fma.f64(double %52, double %72, double 0x3FCDD2C8B74FEBF8)
  %74 = fadd double %36, %36
  %75 = fadd double %74, 1.000000e+00
  %76 = tail call double @llvm.amdgcn.rcp.f64(double %75)
  %77 = fneg double %75
  %78 = tail call double @llvm.fma.f64(double %77, double %76, double 1.000000e+00)
  %79 = tail call double @llvm.fma.f64(double %78, double %76, double %76)
  %80 = tail call double @llvm.fma.f64(double %77, double %79, double 1.000000e+00)
  %81 = tail call double @llvm.fma.f64(double %80, double %79, double %79)
  %82 = tail call double @llvm.fma.f64(double %73, double %81, double %81)
  %83 = fneg double %82
  %84 = tail call double @llvm.fma.f64(double %83, double %74, double 1.000000e+00)
  %85 = fsub double %73, %82
  %86 = fadd double %84, %85
  %87 = tail call double @llvm.fma.f64(double %81, double %86, double %82)
  br label %98

88:                                               ; preds = %32
  %89 = fdiv double 1.000000e+00, %36
  %90 = fmul double %89, %89
  %91 = tail call double @llvm.fma.f64(double %90, double 0xC03D880000000000, double 6.562500e+00)
  %92 = tail call double @llvm.fma.f64(double %90, double %91, double -1.875000e+00)
  %93 = tail call double @llvm.fma.f64(double %90, double %92, double 7.500000e-01)
  %94 = tail call double @llvm.fma.f64(double %90, double %93, double -5.000000e-01)
  %95 = tail call double @llvm.fma.f64(double %90, double %94, double 1.000000e+00)
  %96 = fmul double %89, 0x3FE20DD750429B6D
  %97 = fmul double %96, %95
  br label %98

98:                                               ; preds = %88, %38
  %99 = phi double [ %87, %38 ], [ %97, %88 ]
  %100 = fcmp olt double %35, 0.000000e+00
  br i1 %100, label %101, label %130

101:                                              ; preds = %98
  %102 = fmul double %35, %35
  %103 = fneg double %102
  %104 = tail call double @llvm.fma.f64(double %35, double %35, double %103)
  %105 = fmul double %102, 0x3FF71547652B82FE
  %106 = tail call double @llvm.rint.f64(double %105)
  %107 = fneg double %106
  %108 = tail call double @llvm.fma.f64(double %107, double 0x3FE62E42FEFA39EF, double %102)
  %109 = tail call double @llvm.fma.f64(double %107, double 0x3C7ABC9E3B39803F, double %108)
  %110 = tail call double @llvm.fma.f64(double %109, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %111 = tail call double @llvm.fma.f64(double %109, double %110, double 0x3EC71DEE623FDE64)
  %112 = tail call double @llvm.fma.f64(double %109, double %111, double 0x3EFA01997C89E6B0)
  %113 = tail call double @llvm.fma.f64(double %109, double %112, double 0x3F2A01A014761F6E)
  %114 = tail call double @llvm.fma.f64(double %109, double %113, double 0x3F56C16C1852B7B0)
  %115 = tail call double @llvm.fma.f64(double %109, double %114, double 0x3F81111111122322)
  %116 = tail call double @llvm.fma.f64(double %109, double %115, double 0x3FA55555555502A1)
  %117 = tail call double @llvm.fma.f64(double %109, double %116, double 0x3FC5555555555511)
  %118 = tail call double @llvm.fma.f64(double %109, double %117, double 0x3FE000000000000B)
  %119 = tail call double @llvm.fma.f64(double %109, double %118, double 1.000000e+00)
  %120 = tail call double @llvm.fma.f64(double %109, double %119, double 1.000000e+00)
  %121 = fptosi double %106 to i32
  %122 = tail call double @llvm.amdgcn.ldexp.f64(double %120, i32 %121)
  %123 = fcmp ogt double %102, 1.024000e+03
  %124 = select i1 %123, double 0x7FF0000000000000, double %122
  %125 = tail call double @llvm.fma.f64(double %124, double %104, double %124)
  %126 = fneg double %99
  %127 = tail call double @llvm.fma.f64(double %125, double 2.000000e+00, double %126)
  %128 = fcmp olt double %35, 0xC03AA0F4D2E063CE
  %129 = select i1 %128, double 0x7FF0000000000000, double %127
  br label %130

130:                                              ; preds = %98, %101
  %131 = phi double [ %129, %101 ], [ %99, %98 ]
  %132 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %131, double addrspace(1)* %132, align 8, !tbaa !16
  br label %133

133:                                              ; preds = %130, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

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
