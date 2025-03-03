; ModuleID = '../data/hip_kernels/17971/3/main.cu'
source_filename = "../data/hip_kernels/17971/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16tissueGPU3KernelPfS_S_S_iiiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float %7, float %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = shl nsw i32 %5, 1
  %20 = fmul contract float %7, %7
  %21 = fmul contract float %8, %8
  %22 = icmp slt i32 %18, %4
  br i1 %22, label %23, label %143

23:                                               ; preds = %9
  %24 = sext i32 %18 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = add nsw i32 %18, %4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = shl nsw i32 %4, 1
  %32 = add nsw i32 %18, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = icmp sgt i32 %5, 0
  br i1 %36, label %37, label %140

37:                                               ; preds = %23
  %38 = icmp eq i32 %6, 0
  %39 = fdiv contract float %21, %20
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %39, i32 144)
  %41 = select i1 %40, float 0x41F0000000000000, float 1.000000e+00
  %42 = fmul float %39, %41
  %43 = tail call float @llvm.log2.f32(float %42)
  %44 = fmul float %43, 0x3FE62E42E0000000
  %45 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 519)
  %46 = fneg float %44
  %47 = tail call float @llvm.fma.f32(float %43, float 0x3FE62E42E0000000, float %46)
  %48 = tail call float @llvm.fma.f32(float %43, float 0x3E6EFA39E0000000, float %47)
  %49 = fadd float %44, %48
  %50 = select i1 %45, float %43, float %49
  %51 = select i1 %40, float 0x40362E4300000000, float 0.000000e+00
  %52 = fsub float %50, %51
  %53 = fpext float %52 to double
  %54 = fadd contract double %53, 1.000000e+00
  %55 = fpext float %20 to double
  %56 = fpext float %7 to double
  br label %57

57:                                               ; preds = %37, %132
  %58 = phi i32 [ 0, %37 ], [ %138, %132 ]
  %59 = phi float [ 0.000000e+00, %37 ], [ %137, %132 ]
  %60 = zext i32 %58 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = fsub contract float %62, %26
  %64 = add nsw i32 %58, %5
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fsub contract float %67, %30
  %69 = add nsw i32 %58, %19
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = fsub contract float %72, %35
  %74 = fmul contract float %63, %63
  %75 = fmul contract float %68, %68
  %76 = fadd contract float %74, %75
  %77 = fmul contract float %73, %73
  %78 = fadd contract float %76, %77
  %79 = fcmp contract olt float %78, %20
  br i1 %79, label %80, label %93

80:                                               ; preds = %57
  br i1 %38, label %86, label %81

81:                                               ; preds = %80
  %82 = fdiv contract float %78, %20
  %83 = fpext float %82 to double
  %84 = fsub contract double %54, %83
  %85 = fptrunc double %84 to float
  br label %132

86:                                               ; preds = %80
  %87 = fpext float %78 to double
  %88 = fmul contract double %87, 5.000000e-01
  %89 = fdiv contract double %88, %55
  %90 = fsub contract double 1.500000e+00, %89
  %91 = fdiv contract double %90, %56
  %92 = fptrunc double %91 to float
  br label %132

93:                                               ; preds = %57
  br i1 %38, label %109, label %94

94:                                               ; preds = %93
  %95 = fdiv contract float %21, %78
  %96 = tail call i1 @llvm.amdgcn.class.f32(float %95, i32 144)
  %97 = select i1 %96, float 0x41F0000000000000, float 1.000000e+00
  %98 = fmul float %95, %97
  %99 = tail call float @llvm.log2.f32(float %98)
  %100 = fmul float %99, 0x3FE62E42E0000000
  %101 = tail call i1 @llvm.amdgcn.class.f32(float %99, i32 519)
  %102 = fneg float %100
  %103 = tail call float @llvm.fma.f32(float %99, float 0x3FE62E42E0000000, float %102)
  %104 = tail call float @llvm.fma.f32(float %99, float 0x3E6EFA39E0000000, float %103)
  %105 = fadd float %100, %104
  %106 = select i1 %101, float %99, float %105
  %107 = select i1 %96, float 0x40362E4300000000, float 0.000000e+00
  %108 = fsub float %106, %107
  br label %132

109:                                              ; preds = %93
  %110 = fcmp olt float %78, 0x39F0000000000000
  %111 = select i1 %110, float 0x41F0000000000000, float 1.000000e+00
  %112 = fmul float %78, %111
  %113 = tail call float @llvm.sqrt.f32(float %112)
  %114 = bitcast float %113 to i32
  %115 = add nsw i32 %114, -1
  %116 = bitcast i32 %115 to float
  %117 = add nsw i32 %114, 1
  %118 = bitcast i32 %117 to float
  %119 = tail call i1 @llvm.amdgcn.class.f32(float %112, i32 608)
  %120 = select i1 %110, float 0x3EF0000000000000, float 1.000000e+00
  %121 = fneg float %118
  %122 = tail call float @llvm.fma.f32(float %121, float %113, float %112)
  %123 = fcmp ogt float %122, 0.000000e+00
  %124 = fneg float %116
  %125 = tail call float @llvm.fma.f32(float %124, float %113, float %112)
  %126 = fcmp ole float %125, 0.000000e+00
  %127 = select i1 %126, float %116, float %113
  %128 = select i1 %123, float %118, float %127
  %129 = fmul float %120, %128
  %130 = select i1 %119, float %112, float %129
  %131 = fdiv contract float 1.000000e+00, %130
  br label %132

132:                                              ; preds = %94, %109, %81, %86
  %133 = phi float [ %85, %81 ], [ %92, %86 ], [ %108, %94 ], [ %131, %109 ]
  %134 = getelementptr inbounds float, float addrspace(1)* %3, i64 %60
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !5
  %136 = fmul contract float %133, %135
  %137 = fadd contract float %59, %136
  %138 = add nuw nsw i32 %58, 1
  %139 = icmp eq i32 %138, %5
  br i1 %139, label %140, label %57, !llvm.loop !11

140:                                              ; preds = %132, %23
  %141 = phi float [ 0.000000e+00, %23 ], [ %137, %132 ]
  %142 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  store float %141, float addrspace(1)* %142, align 4, !tbaa !7
  br label %143

143:                                              ; preds = %140, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
