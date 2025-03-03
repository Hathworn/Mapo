; ModuleID = '../data/hip_kernels/5330/9/main.cu'
source_filename = "../data/hip_kernels/5330/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15backward_kernelPKfS0_S0_S0_S0_S0_S0_PfS1_S1_fiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* readonly %3, float addrspace(1)* readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* writeonly %7, float addrspace(1)* %8, float addrspace(1)* %9, float %10, i32 %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %5, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !4, !amdgpu.noclobber !8
  %19 = getelementptr inbounds float, float addrspace(1)* %6, i64 %16
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !4, !amdgpu.noclobber !8
  %21 = icmp eq float addrspace(1)* %3, addrspacecast (float* null to float addrspace(1)*)
  br i1 %21, label %27, label %22

22:                                               ; preds = %14
  %23 = getelementptr inbounds float, float addrspace(1)* %3, i64 %16
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !4, !amdgpu.noclobber !8
  %25 = tail call float @llvm.fabs.f32(float %24)
  %26 = fadd contract float %25, %10
  br label %27

27:                                               ; preds = %14, %22
  %28 = phi contract float [ %26, %22 ], [ 1.000000e+00, %14 ]
  %29 = icmp eq float addrspace(1)* %4, addrspacecast (float* null to float addrspace(1)*)
  br i1 %29, label %33, label %30

30:                                               ; preds = %27
  %31 = getelementptr inbounds float, float addrspace(1)* %4, i64 %16
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !4, !amdgpu.noclobber !8
  br label %33

33:                                               ; preds = %27, %30
  %34 = phi contract float [ %32, %30 ], [ 0.000000e+00, %27 ]
  %35 = icmp eq float addrspace(1)* %7, addrspacecast (float* null to float addrspace(1)*)
  br i1 %35, label %104, label %36

36:                                               ; preds = %33
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !4, !amdgpu.noclobber !8
  %39 = fcmp contract une float %38, 0.000000e+00
  %40 = fcmp contract une float %10, 0.000000e+00
  %41 = select i1 %39, i1 true, i1 %40
  br i1 %41, label %42, label %66

42:                                               ; preds = %36
  %43 = fadd contract float %38, %10
  %44 = fcmp olt float %43, 0x39F0000000000000
  %45 = select i1 %44, float 0x41F0000000000000, float 1.000000e+00
  %46 = fmul float %43, %45
  %47 = tail call float @llvm.sqrt.f32(float %46)
  %48 = bitcast float %47 to i32
  %49 = add nsw i32 %48, -1
  %50 = bitcast i32 %49 to float
  %51 = add nsw i32 %48, 1
  %52 = bitcast i32 %51 to float
  %53 = tail call i1 @llvm.amdgcn.class.f32(float %46, i32 608)
  %54 = select i1 %44, float 0x3EF0000000000000, float 1.000000e+00
  %55 = fneg float %52
  %56 = tail call float @llvm.fma.f32(float %55, float %47, float %46)
  %57 = fcmp ogt float %56, 0.000000e+00
  %58 = fneg float %50
  %59 = tail call float @llvm.fma.f32(float %58, float %47, float %46)
  %60 = fcmp ole float %59, 0.000000e+00
  %61 = select i1 %60, float %50, float %47
  %62 = select i1 %57, float %52, float %61
  %63 = fmul float %54, %62
  %64 = select i1 %53, float %46, float %63
  %65 = fdiv contract float 1.000000e+00, %64
  br label %66

66:                                               ; preds = %36, %42
  %67 = phi float [ %65, %42 ], [ 0.000000e+00, %36 ]
  %68 = fmul contract float %28, %67
  %69 = icmp sgt i32 %11, 0
  br i1 %69, label %70, label %104

70:                                               ; preds = %66
  %71 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %72 = icmp slt i32 %71, %13
  %73 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %74 = getelementptr i8, i8 addrspace(4)* %73, i64 4
  %75 = bitcast i8 addrspace(4)* %74 to i16 addrspace(4)*
  br label %76

76:                                               ; preds = %70, %84
  %77 = phi i32 [ 0, %70 ], [ %85, %84 ]
  br i1 %72, label %78, label %84

78:                                               ; preds = %76
  %79 = mul nsw i32 %77, %12
  %80 = add nsw i32 %79, %15
  %81 = mul nsw i32 %80, %13
  %82 = load i16, i16 addrspace(4)* %75, align 4, !range !10, !invariant.load !8
  %83 = zext i16 %82 to i32
  br label %87

84:                                               ; preds = %87, %76
  %85 = add nuw nsw i32 %77, 1
  %86 = icmp eq i32 %85, %11
  br i1 %86, label %104, label %76, !llvm.loop !11

87:                                               ; preds = %78, %87
  %88 = phi i32 [ %71, %78 ], [ %102, %87 ]
  %89 = add nsw i32 %88, %81
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !4
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !4
  %95 = fsub contract float %94, %34
  %96 = fdiv contract float %95, %28
  %97 = fsub contract float %92, %18
  %98 = fmul contract float %20, %96
  %99 = fsub contract float %97, %98
  %100 = fmul contract float %68, %99
  %101 = getelementptr inbounds float, float addrspace(1)* %7, i64 %90
  store float %100, float addrspace(1)* %101, align 4, !tbaa !4
  %102 = add i32 %88, %83
  %103 = icmp slt i32 %102, %13
  br i1 %103, label %87, label %84, !llvm.loop !13

104:                                              ; preds = %84, %66, %33
  %105 = icmp ne float addrspace(1)* %8, addrspacecast (float* null to float addrspace(1)*)
  %106 = icmp ne float addrspace(1)* %9, addrspacecast (float* null to float addrspace(1)*)
  %107 = select i1 %105, i1 true, i1 %106
  br i1 %107, label %108, label %137

108:                                              ; preds = %104
  %109 = mul nsw i32 %13, %11
  %110 = sitofp i32 %109 to float
  %111 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %112 = icmp eq i32 %111, 0
  %113 = select i1 %105, i1 %112, i1 false
  br i1 %113, label %114, label %130

114:                                              ; preds = %108
  %115 = getelementptr inbounds float, float addrspace(1)* %3, i64 %16
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !4
  %117 = fcmp contract ogt float %116, 0.000000e+00
  br i1 %117, label %118, label %123

118:                                              ; preds = %114
  %119 = fmul contract float %20, %110
  %120 = getelementptr inbounds float, float addrspace(1)* %8, i64 %16
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !4
  %122 = fadd contract float %119, %121
  store float %122, float addrspace(1)* %120, align 4, !tbaa !4
  br label %130

123:                                              ; preds = %114
  %124 = fcmp contract olt float %116, 0.000000e+00
  br i1 %124, label %125, label %130

125:                                              ; preds = %123
  %126 = fmul contract float %20, %110
  %127 = getelementptr inbounds float, float addrspace(1)* %8, i64 %16
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !4
  %129 = fsub contract float %128, %126
  store float %129, float addrspace(1)* %127, align 4, !tbaa !4
  br label %130

130:                                              ; preds = %123, %125, %118, %108
  %131 = select i1 %106, i1 %112, i1 false
  br i1 %131, label %132, label %137

132:                                              ; preds = %130
  %133 = fmul contract float %18, %110
  %134 = getelementptr inbounds float, float addrspace(1)* %9, i64 %16
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !4
  %136 = fadd contract float %133, %135
  store float %136, float addrspace(1)* %134, align 4, !tbaa !4
  br label %137

137:                                              ; preds = %130, %132, %104
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
