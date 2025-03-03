; ModuleID = '../data/hip_kernels/5182/348/main.cu'
source_filename = "../data/hip_kernels/5182/348/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25UniformNormalDistributionPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = udiv i32 %11, %8
  %15 = mul i32 %14, %8
  %16 = icmp ugt i32 %11, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %13
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %12
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %20
  %24 = icmp slt i32 %23, %2
  br i1 %24, label %25, label %159

25:                                               ; preds = %3
  %26 = sext i32 %23 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !16, !amdgpu.noclobber !5
  %29 = sitofp i32 %2 to float
  %30 = icmp slt i32 %2, 1
  %31 = select i1 %30, float 0x41F0000000000000, float 1.000000e+00
  %32 = fmul float %31, %29
  %33 = tail call float @llvm.sqrt.f32(float %32)
  %34 = bitcast float %33 to i32
  %35 = add nsw i32 %34, -1
  %36 = bitcast i32 %35 to float
  %37 = add nsw i32 %34, 1
  %38 = bitcast i32 %37 to float
  %39 = tail call i1 @llvm.amdgcn.class.f32(float %32, i32 608)
  %40 = select i1 %30, float 0x3EF0000000000000, float 1.000000e+00
  %41 = fneg float %38
  %42 = tail call float @llvm.fma.f32(float %41, float %33, float %32)
  %43 = fcmp ogt float %42, 0.000000e+00
  %44 = fneg float %36
  %45 = tail call float @llvm.fma.f32(float %44, float %33, float %32)
  %46 = fcmp ole float %45, 0.000000e+00
  %47 = select i1 %46, float %36, float %33
  %48 = select i1 %43, float %38, float %47
  %49 = fmul float %40, %48
  %50 = select i1 %39, float %32, float %49
  %51 = fmul contract float %50, %28
  %52 = fpext float %51 to double
  %53 = tail call double @llvm.fabs.f64(double %52)
  %54 = fcmp ogt double %53, 0x40434D4EDCE2B7D6
  %55 = tail call double @llvm.copysign.f64(double 0x40434D4EDCE2B7D6, double %52)
  %56 = select i1 %54, double %55, double %52
  %57 = fmul double %56, 0xBFE6A09E667F3BCD
  %58 = fneg double %57
  %59 = tail call double @llvm.fma.f64(double %56, double 0xBFE6A09E667F3BCD, double %58)
  %60 = tail call double @llvm.fma.f64(double %56, double 0x3C8BDD3413B26456, double %59)
  %61 = fadd double %57, %60
  %62 = fsub double %61, %57
  %63 = fsub double %60, %62
  %64 = tail call double @llvm.fabs.f64(double %61)
  %65 = fneg double %61
  %66 = fmul double %61, %65
  %67 = fneg double %66
  %68 = tail call double @llvm.fma.f64(double %65, double %61, double %67)
  %69 = fmul double %66, 0x3FF71547652B82FE
  %70 = tail call double @llvm.rint.f64(double %69)
  %71 = fneg double %70
  %72 = tail call double @llvm.fma.f64(double %71, double 0x3FE62E42FEFA39EF, double %66)
  %73 = tail call double @llvm.fma.f64(double %71, double 0x3C7ABC9E3B39803F, double %72)
  %74 = tail call double @llvm.fma.f64(double %73, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %75 = tail call double @llvm.fma.f64(double %73, double %74, double 0x3EC71DEE623FDE64)
  %76 = tail call double @llvm.fma.f64(double %73, double %75, double 0x3EFA01997C89E6B0)
  %77 = tail call double @llvm.fma.f64(double %73, double %76, double 0x3F2A01A014761F6E)
  %78 = tail call double @llvm.fma.f64(double %73, double %77, double 0x3F56C16C1852B7B0)
  %79 = tail call double @llvm.fma.f64(double %73, double %78, double 0x3F81111111122322)
  %80 = tail call double @llvm.fma.f64(double %73, double %79, double 0x3FA55555555502A1)
  %81 = tail call double @llvm.fma.f64(double %73, double %80, double 0x3FC5555555555511)
  %82 = tail call double @llvm.fma.f64(double %73, double %81, double 0x3FE000000000000B)
  %83 = tail call double @llvm.fma.f64(double %73, double %82, double 1.000000e+00)
  %84 = tail call double @llvm.fma.f64(double %73, double %83, double 1.000000e+00)
  %85 = fptosi double %70 to i32
  %86 = tail call double @llvm.amdgcn.ldexp.f64(double %84, i32 %85)
  %87 = fcmp ogt double %66, 1.024000e+03
  %88 = select i1 %87, double 0x7FF0000000000000, double %86
  %89 = fcmp olt double %66, -1.075000e+03
  %90 = select i1 %89, double 0.000000e+00, double %88
  %91 = tail call double @llvm.fma.f64(double %90, double %68, double %90)
  %92 = fadd double %64, -4.000000e+00
  %93 = fadd double %64, 4.000000e+00
  %94 = tail call double @llvm.amdgcn.rcp.f64(double %93)
  %95 = fneg double %93
  %96 = tail call double @llvm.fma.f64(double %95, double %94, double 1.000000e+00)
  %97 = tail call double @llvm.fma.f64(double %96, double %94, double %94)
  %98 = tail call double @llvm.fma.f64(double %95, double %97, double 1.000000e+00)
  %99 = tail call double @llvm.fma.f64(double %98, double %97, double %97)
  %100 = fmul double %92, %99
  %101 = fneg double %100
  %102 = fadd double %100, 1.000000e+00
  %103 = tail call double @llvm.fma.f64(double %102, double -4.000000e+00, double %64)
  %104 = tail call double @llvm.fma.f64(double %101, double %64, double %103)
  %105 = tail call double @llvm.fma.f64(double %99, double %104, double %100)
  %106 = tail call double @llvm.fma.f64(double %105, double 0xBE41F39D54DF3C0E, double 0xBE41166337CFA789)
  %107 = tail call double @llvm.fma.f64(double %105, double %106, double 0x3E7B45F1D9802B82)
  %108 = tail call double @llvm.fma.f64(double %105, double %107, double 0x3E6D90488A03DCDB)
  %109 = tail call double @llvm.fma.f64(double %105, double %108, double 0xBEAB87B02EBA62D8)
  %110 = tail call double @llvm.fma.f64(double %105, double %109, double 0x3E95104BA56E15F1)
  %111 = tail call double @llvm.fma.f64(double %105, double %110, double 0x3ED7F29F71C907DE)
  %112 = tail call double @llvm.fma.f64(double %105, double %111, double 0xBEE78F5C2CD770FB)
  %113 = tail call double @llvm.fma.f64(double %105, double %112, double 0xBEF995FB76D0A51A)
  %114 = tail call double @llvm.fma.f64(double %105, double %113, double 0x3F23BE2EC022D0ED)
  %115 = tail call double @llvm.fma.f64(double %105, double %114, double 0xBF2A1DEB2FDBF62E)
  %116 = tail call double @llvm.fma.f64(double %105, double %115, double 0xBF48D4AC3689FC43)
  %117 = tail call double @llvm.fma.f64(double %105, double %116, double 0x3F749C67192D909B)
  %118 = tail call double @llvm.fma.f64(double %105, double %117, double 0xBF909623852FF070)
  %119 = tail call double @llvm.fma.f64(double %105, double %118, double 0x3FA3079EDFADEA8F)
  %120 = tail call double @llvm.fma.f64(double %105, double %119, double 0xBFB0FB06DFF65910)
  %121 = tail call double @llvm.fma.f64(double %105, double %120, double 0x3FB7FEE004DE8F32)
  %122 = tail call double @llvm.fma.f64(double %105, double %121, double 0xBFB9DDB23C3DBEB3)
  %123 = tail call double @llvm.fma.f64(double %105, double %122, double 0x3FB16ECEFCFA6930)
  %124 = tail call double @llvm.fma.f64(double %105, double %123, double 0x3F8F7F5DF66FB8A3)
  %125 = tail call double @llvm.fma.f64(double %105, double %124, double 0xBFC1DF1AD154A2A8)
  %126 = tail call double @llvm.fma.f64(double %105, double %125, double 0x3FCDD2C8B74FEBF8)
  %127 = fadd double %64, %64
  %128 = fadd double %127, 1.000000e+00
  %129 = tail call double @llvm.amdgcn.rcp.f64(double %128)
  %130 = fneg double %128
  %131 = tail call double @llvm.fma.f64(double %130, double %129, double 1.000000e+00)
  %132 = tail call double @llvm.fma.f64(double %131, double %129, double %129)
  %133 = tail call double @llvm.fma.f64(double %130, double %132, double 1.000000e+00)
  %134 = tail call double @llvm.fma.f64(double %133, double %132, double %132)
  %135 = tail call double @llvm.fma.f64(double %126, double %134, double %134)
  %136 = fneg double %135
  %137 = tail call double @llvm.fma.f64(double %136, double %127, double 1.000000e+00)
  %138 = fsub double %126, %135
  %139 = fadd double %137, %138
  %140 = tail call double @llvm.fma.f64(double %134, double %139, double %135)
  %141 = fmul double %91, %140
  %142 = fcmp ogt double %64, 0x403B39DC41E48BFC
  %143 = select i1 %142, double 0.000000e+00, double %141
  %144 = fsub double 2.000000e+00, %143
  %145 = fcmp olt double %61, 0.000000e+00
  %146 = select i1 %145, double %144, double %143
  %147 = fmul double %61, -2.000000e+00
  %148 = fmul double %147, %146
  %149 = fcmp oge double %56, -1.000000e+00
  %150 = select i1 %149, double 0.000000e+00, double %148
  %151 = tail call double @llvm.fma.f64(double %63, double %150, double %146)
  %152 = fmul double %151, 5.000000e-01
  %153 = fptrunc double %152 to float
  %154 = fpext float %153 to double
  %155 = fadd contract double %154, -5.000000e-01
  %156 = fmul contract double %155, 2.000000e+00
  %157 = fptrunc double %156 to float
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %157, float addrspace(1)* %158, align 4, !tbaa !16
  br label %159

159:                                              ; preds = %25, %3
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
