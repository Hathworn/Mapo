; ModuleID = '../data/hip_kernels/1/17/main.cu'
source_filename = "../data/hip_kernels/1/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11makeHVectoriPfS_E4beta = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ11makeHVectoriPfS_E4sums = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11makeHVectoriPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp ult i32 %4, %0
  br i1 %5, label %6, label %117

6:                                                ; preds = %3
  %7 = icmp slt i32 %4, %0
  br i1 %7, label %8, label %26

8:                                                ; preds = %6
  %9 = icmp eq i32 %4, 0
  br label %10

10:                                               ; preds = %8, %22
  %11 = phi float [ 0.000000e+00, %8 ], [ %23, %22 ]
  %12 = phi i32 [ %4, %8 ], [ %24, %22 ]
  %13 = icmp eq i32 %12, 0
  %14 = select i1 %9, i1 %13, i1 false
  br i1 %14, label %22, label %15

15:                                               ; preds = %10
  %16 = zext i32 %12 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  store float %18, float addrspace(1)* %19, align 4, !tbaa !5
  %20 = fmul contract float %18, %18
  %21 = fadd contract float %11, %20
  br label %22

22:                                               ; preds = %10, %15
  %23 = phi float [ %11, %10 ], [ %21, %15 ]
  %24 = add nuw nsw i32 %12, 512
  %25 = icmp slt i32 %24, %0
  br i1 %25, label %10, label %26, !llvm.loop !9

26:                                               ; preds = %22, %6
  %27 = phi float [ 0.000000e+00, %6 ], [ %23, %22 ]
  %28 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ11makeHVectoriPfS_E4sums, i32 0, i32 %4
  store float %27, float addrspace(3)* %28, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %30 = getelementptr i8, i8 addrspace(4)* %29, i64 4
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 4, !range !11, !invariant.load !12
  %33 = icmp ult i16 %32, 2
  br i1 %33, label %50, label %34

34:                                               ; preds = %26
  %35 = zext i16 %32 to i32
  br label %36

36:                                               ; preds = %34, %48
  %37 = phi i32 [ %38, %48 ], [ %35, %34 ]
  %38 = lshr i32 %37, 1
  %39 = add nuw nsw i32 %38, %4
  %40 = icmp ult i32 %4, %38
  %41 = icmp slt i32 %39, %0
  %42 = select i1 %40, i1 %41, i1 false
  br i1 %42, label %43, label %48

43:                                               ; preds = %36
  %44 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ11makeHVectoriPfS_E4sums, i32 0, i32 %39
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %46 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %47 = fadd contract float %45, %46
  store float %47, float addrspace(3)* %28, align 4, !tbaa !5
  br label %48

48:                                               ; preds = %43, %36
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ult i32 %37, 4
  br i1 %49, label %50, label %36, !llvm.loop !13

50:                                               ; preds = %48, %26
  %51 = icmp eq i32 %4, 0
  br i1 %51, label %52, label %106

52:                                               ; preds = %50
  %53 = load float, float addrspace(1)* %1, align 4, !tbaa !5
  %54 = fmul contract float %53, %53
  %55 = load float, float addrspace(3)* getelementptr inbounds ([512 x float], [512 x float] addrspace(3)* @_ZZ11makeHVectoriPfS_E4sums, i32 0, i32 0), align 16, !tbaa !5
  %56 = fadd contract float %54, %55
  %57 = fcmp olt float %56, 0x39F0000000000000
  %58 = select i1 %57, float 0x41F0000000000000, float 1.000000e+00
  %59 = fmul float %56, %58
  %60 = tail call float @llvm.sqrt.f32(float %59)
  %61 = bitcast float %60 to i32
  %62 = add nsw i32 %61, -1
  %63 = bitcast i32 %62 to float
  %64 = add nsw i32 %61, 1
  %65 = bitcast i32 %64 to float
  %66 = tail call i1 @llvm.amdgcn.class.f32(float %59, i32 608)
  %67 = select i1 %57, float 0x3EF0000000000000, float 1.000000e+00
  %68 = fneg float %65
  %69 = tail call float @llvm.fma.f32(float %68, float %60, float %59)
  %70 = fcmp ogt float %69, 0.000000e+00
  %71 = fneg float %63
  %72 = tail call float @llvm.fma.f32(float %71, float %60, float %59)
  %73 = fcmp ole float %72, 0.000000e+00
  %74 = select i1 %73, float %63, float %60
  %75 = select i1 %70, float %65, float %74
  %76 = fmul float %67, %75
  %77 = select i1 %66, float %59, float %76
  %78 = fcmp contract ogt float %53, 0.000000e+00
  %79 = fneg contract float %77
  %80 = select i1 %78, float %77, float %79
  %81 = fadd contract float %53, %80
  store float %81, float addrspace(1)* %2, align 4, !tbaa !5
  %82 = fmul contract float %81, %81
  %83 = fadd contract float %55, %82
  %84 = fdiv contract float 2.000000e+00, %83
  %85 = fcmp olt float %84, 0x39F0000000000000
  %86 = select i1 %85, float 0x41F0000000000000, float 1.000000e+00
  %87 = fmul float %84, %86
  %88 = tail call float @llvm.sqrt.f32(float %87)
  %89 = bitcast float %88 to i32
  %90 = add nsw i32 %89, -1
  %91 = bitcast i32 %90 to float
  %92 = add nsw i32 %89, 1
  %93 = bitcast i32 %92 to float
  %94 = tail call i1 @llvm.amdgcn.class.f32(float %87, i32 608)
  %95 = select i1 %85, float 0x3EF0000000000000, float 1.000000e+00
  %96 = fneg float %93
  %97 = tail call float @llvm.fma.f32(float %96, float %88, float %87)
  %98 = fcmp ogt float %97, 0.000000e+00
  %99 = fneg float %91
  %100 = tail call float @llvm.fma.f32(float %99, float %88, float %87)
  %101 = fcmp ole float %100, 0.000000e+00
  %102 = select i1 %101, float %91, float %88
  %103 = select i1 %98, float %93, float %102
  %104 = fmul float %95, %103
  %105 = select i1 %94, float %87, float %104
  store float %105, float addrspace(3)* @_ZZ11makeHVectoriPfS_E4beta, align 4, !tbaa !5
  br label %106

106:                                              ; preds = %52, %50
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %7, label %107, label %117

107:                                              ; preds = %106
  %108 = load float, float addrspace(3)* @_ZZ11makeHVectoriPfS_E4beta, align 4, !tbaa !5
  br label %109

109:                                              ; preds = %107, %109
  %110 = phi i32 [ %4, %107 ], [ %115, %109 ]
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %2, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5
  %114 = fmul contract float %108, %113
  store float %114, float addrspace(1)* %112, align 4, !tbaa !5
  %115 = add nuw nsw i32 %110, 512
  %116 = icmp slt i32 %115, %0
  br i1 %116, label %109, label %117, !llvm.loop !14

117:                                              ; preds = %109, %106, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{i16 1, i16 1025}
!12 = !{}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
