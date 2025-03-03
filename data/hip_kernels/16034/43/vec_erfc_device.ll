; ModuleID = '../data/hip_kernels/16034/43/main.cu'
source_filename = "../data/hip_kernels/16034/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_erfc(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %120

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fneg double %35
  %38 = fmul double %35, %37
  %39 = fneg double %38
  %40 = tail call double @llvm.fma.f64(double %37, double %35, double %39)
  %41 = fmul double %38, 0x3FF71547652B82FE
  %42 = tail call double @llvm.rint.f64(double %41)
  %43 = fneg double %42
  %44 = tail call double @llvm.fma.f64(double %43, double 0x3FE62E42FEFA39EF, double %38)
  %45 = tail call double @llvm.fma.f64(double %43, double 0x3C7ABC9E3B39803F, double %44)
  %46 = tail call double @llvm.fma.f64(double %45, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %47 = tail call double @llvm.fma.f64(double %45, double %46, double 0x3EC71DEE623FDE64)
  %48 = tail call double @llvm.fma.f64(double %45, double %47, double 0x3EFA01997C89E6B0)
  %49 = tail call double @llvm.fma.f64(double %45, double %48, double 0x3F2A01A014761F6E)
  %50 = tail call double @llvm.fma.f64(double %45, double %49, double 0x3F56C16C1852B7B0)
  %51 = tail call double @llvm.fma.f64(double %45, double %50, double 0x3F81111111122322)
  %52 = tail call double @llvm.fma.f64(double %45, double %51, double 0x3FA55555555502A1)
  %53 = tail call double @llvm.fma.f64(double %45, double %52, double 0x3FC5555555555511)
  %54 = tail call double @llvm.fma.f64(double %45, double %53, double 0x3FE000000000000B)
  %55 = tail call double @llvm.fma.f64(double %45, double %54, double 1.000000e+00)
  %56 = tail call double @llvm.fma.f64(double %45, double %55, double 1.000000e+00)
  %57 = fptosi double %42 to i32
  %58 = tail call double @llvm.amdgcn.ldexp.f64(double %56, i32 %57)
  %59 = fcmp ogt double %38, 1.024000e+03
  %60 = select i1 %59, double 0x7FF0000000000000, double %58
  %61 = fcmp olt double %38, -1.075000e+03
  %62 = select i1 %61, double 0.000000e+00, double %60
  %63 = tail call double @llvm.fma.f64(double %62, double %40, double %62)
  %64 = fadd double %36, -4.000000e+00
  %65 = fadd double %36, 4.000000e+00
  %66 = tail call double @llvm.amdgcn.rcp.f64(double %65)
  %67 = fneg double %65
  %68 = tail call double @llvm.fma.f64(double %67, double %66, double 1.000000e+00)
  %69 = tail call double @llvm.fma.f64(double %68, double %66, double %66)
  %70 = tail call double @llvm.fma.f64(double %67, double %69, double 1.000000e+00)
  %71 = tail call double @llvm.fma.f64(double %70, double %69, double %69)
  %72 = fmul double %64, %71
  %73 = fneg double %72
  %74 = fadd double %72, 1.000000e+00
  %75 = tail call double @llvm.fma.f64(double %74, double -4.000000e+00, double %36)
  %76 = tail call double @llvm.fma.f64(double %73, double %36, double %75)
  %77 = tail call double @llvm.fma.f64(double %71, double %76, double %72)
  %78 = tail call double @llvm.fma.f64(double %77, double 0xBE41F39D54DF3C0E, double 0xBE41166337CFA789)
  %79 = tail call double @llvm.fma.f64(double %77, double %78, double 0x3E7B45F1D9802B82)
  %80 = tail call double @llvm.fma.f64(double %77, double %79, double 0x3E6D90488A03DCDB)
  %81 = tail call double @llvm.fma.f64(double %77, double %80, double 0xBEAB87B02EBA62D8)
  %82 = tail call double @llvm.fma.f64(double %77, double %81, double 0x3E95104BA56E15F1)
  %83 = tail call double @llvm.fma.f64(double %77, double %82, double 0x3ED7F29F71C907DE)
  %84 = tail call double @llvm.fma.f64(double %77, double %83, double 0xBEE78F5C2CD770FB)
  %85 = tail call double @llvm.fma.f64(double %77, double %84, double 0xBEF995FB76D0A51A)
  %86 = tail call double @llvm.fma.f64(double %77, double %85, double 0x3F23BE2EC022D0ED)
  %87 = tail call double @llvm.fma.f64(double %77, double %86, double 0xBF2A1DEB2FDBF62E)
  %88 = tail call double @llvm.fma.f64(double %77, double %87, double 0xBF48D4AC3689FC43)
  %89 = tail call double @llvm.fma.f64(double %77, double %88, double 0x3F749C67192D909B)
  %90 = tail call double @llvm.fma.f64(double %77, double %89, double 0xBF909623852FF070)
  %91 = tail call double @llvm.fma.f64(double %77, double %90, double 0x3FA3079EDFADEA8F)
  %92 = tail call double @llvm.fma.f64(double %77, double %91, double 0xBFB0FB06DFF65910)
  %93 = tail call double @llvm.fma.f64(double %77, double %92, double 0x3FB7FEE004DE8F32)
  %94 = tail call double @llvm.fma.f64(double %77, double %93, double 0xBFB9DDB23C3DBEB3)
  %95 = tail call double @llvm.fma.f64(double %77, double %94, double 0x3FB16ECEFCFA6930)
  %96 = tail call double @llvm.fma.f64(double %77, double %95, double 0x3F8F7F5DF66FB8A3)
  %97 = tail call double @llvm.fma.f64(double %77, double %96, double 0xBFC1DF1AD154A2A8)
  %98 = tail call double @llvm.fma.f64(double %77, double %97, double 0x3FCDD2C8B74FEBF8)
  %99 = fadd double %36, %36
  %100 = fadd double %99, 1.000000e+00
  %101 = tail call double @llvm.amdgcn.rcp.f64(double %100)
  %102 = fneg double %100
  %103 = tail call double @llvm.fma.f64(double %102, double %101, double 1.000000e+00)
  %104 = tail call double @llvm.fma.f64(double %103, double %101, double %101)
  %105 = tail call double @llvm.fma.f64(double %102, double %104, double 1.000000e+00)
  %106 = tail call double @llvm.fma.f64(double %105, double %104, double %104)
  %107 = tail call double @llvm.fma.f64(double %98, double %106, double %106)
  %108 = fneg double %107
  %109 = tail call double @llvm.fma.f64(double %108, double %99, double 1.000000e+00)
  %110 = fsub double %98, %107
  %111 = fadd double %109, %110
  %112 = tail call double @llvm.fma.f64(double %106, double %111, double %107)
  %113 = fmul double %63, %112
  %114 = fcmp ogt double %36, 0x403B39DC41E48BFC
  %115 = select i1 %114, double 0.000000e+00, double %113
  %116 = fsub double 2.000000e+00, %115
  %117 = fcmp olt double %35, 0.000000e+00
  %118 = select i1 %117, double %116, double %115
  %119 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %118, double addrspace(1)* %119, align 8, !tbaa !16
  br label %120

120:                                              ; preds = %32, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

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
