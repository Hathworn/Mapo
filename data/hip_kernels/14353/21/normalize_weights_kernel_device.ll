; ModuleID = '../data/hip_kernels/14353/21/main.cu'
source_filename = "../data/hip_kernels/14353/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24normalize_weights_kernelPfiS_S_S_PiE2u1 = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ24normalize_weights_kernelPfiS_S_S_PiE10sumWeights = internal unnamed_addr addrspace(3) global float undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24normalize_weights_kernelPfiS_S_S_Pi(float addrspace(1)* nocapture %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp eq i32 %14, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %6
  %18 = load float, float addrspace(1)* %2, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %18, float addrspace(3)* @_ZZ24normalize_weights_kernelPfiS_S_S_PiE10sumWeights, align 4, !tbaa !7
  br label %19

19:                                               ; preds = %17, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp slt i32 %15, %1
  br i1 %20, label %21, label %27

21:                                               ; preds = %19
  %22 = sext i32 %15 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = load float, float addrspace(3)* @_ZZ24normalize_weights_kernelPfiS_S_S_PiE10sumWeights, align 4, !tbaa !7
  %26 = fdiv contract float %24, %25
  store float %26, float addrspace(1)* %23, align 4, !tbaa !7
  br label %27

27:                                               ; preds = %21, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp eq i32 %15, 0
  br i1 %28, label %29, label %121

29:                                               ; preds = %27
  %30 = load float, float addrspace(1)* %0, align 4, !tbaa !7
  store float %30, float addrspace(1)* %3, align 4, !tbaa !7
  %31 = icmp sgt i32 %1, 1
  br i1 %31, label %32, label %110

32:                                               ; preds = %29
  %33 = load float, float addrspace(1)* %3, align 4
  %34 = add i32 %1, -1
  %35 = add i32 %1, -2
  %36 = and i32 %34, 7
  %37 = icmp ult i32 %35, 7
  br i1 %37, label %94, label %38

38:                                               ; preds = %32
  %39 = and i32 %34, -8
  br label %40

40:                                               ; preds = %40, %38
  %41 = phi float [ %33, %38 ], [ %89, %40 ]
  %42 = phi i32 [ 1, %38 ], [ %91, %40 ]
  %43 = phi i32 [ 0, %38 ], [ %92, %40 ]
  %44 = zext i32 %42 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fadd contract float %46, %41
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  store float %47, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = add nuw nsw i32 %42, 1
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fadd contract float %52, %47
  %54 = getelementptr inbounds float, float addrspace(1)* %3, i64 %50
  store float %53, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = add nuw nsw i32 %42, 2
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = fadd contract float %58, %53
  %60 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  store float %59, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = add nuw nsw i32 %42, 3
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fadd contract float %64, %59
  %66 = getelementptr inbounds float, float addrspace(1)* %3, i64 %62
  store float %65, float addrspace(1)* %66, align 4, !tbaa !7
  %67 = add nuw nsw i32 %42, 4
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fadd contract float %70, %65
  %72 = getelementptr inbounds float, float addrspace(1)* %3, i64 %68
  store float %71, float addrspace(1)* %72, align 4, !tbaa !7
  %73 = add nuw nsw i32 %42, 5
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fadd contract float %76, %71
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %74
  store float %77, float addrspace(1)* %78, align 4, !tbaa !7
  %79 = add nuw nsw i32 %42, 6
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fadd contract float %82, %77
  %84 = getelementptr inbounds float, float addrspace(1)* %3, i64 %80
  store float %83, float addrspace(1)* %84, align 4, !tbaa !7
  %85 = add nuw nsw i32 %42, 7
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fadd contract float %88, %83
  %90 = getelementptr inbounds float, float addrspace(1)* %3, i64 %86
  store float %89, float addrspace(1)* %90, align 4, !tbaa !7
  %91 = add nuw nsw i32 %42, 8
  %92 = add i32 %43, 8
  %93 = icmp eq i32 %92, %39
  br i1 %93, label %94, label %40, !llvm.loop !11

94:                                               ; preds = %40, %32
  %95 = phi float [ %33, %32 ], [ %89, %40 ]
  %96 = phi i32 [ 1, %32 ], [ %91, %40 ]
  %97 = icmp eq i32 %36, 0
  br i1 %97, label %110, label %98

98:                                               ; preds = %94, %98
  %99 = phi float [ %105, %98 ], [ %95, %94 ]
  %100 = phi i32 [ %107, %98 ], [ %96, %94 ]
  %101 = phi i32 [ %108, %98 ], [ 0, %94 ]
  %102 = zext i32 %100 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = fadd contract float %104, %99
  %106 = getelementptr inbounds float, float addrspace(1)* %3, i64 %102
  store float %105, float addrspace(1)* %106, align 4, !tbaa !7
  %107 = add nuw nsw i32 %100, 1
  %108 = add i32 %101, 1
  %109 = icmp eq i32 %108, %36
  br i1 %109, label %110, label %98, !llvm.loop !13

110:                                              ; preds = %94, %98, %29
  %111 = sitofp i32 %1 to float
  %112 = fdiv contract float 1.000000e+00, %111
  %113 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !15, !amdgpu.noclobber !5
  %114 = mul nsw i32 %113, 1103515245
  %115 = add nsw i32 %114, 12345
  %116 = srem i32 %115, 2147483647
  store i32 %116, i32 addrspace(1)* %5, align 4, !tbaa !15
  %117 = sitofp i32 %116 to float
  %118 = fmul contract float %117, 0x3E00000000000000
  %119 = tail call float @llvm.fabs.f32(float %118)
  %120 = fmul contract float %112, %119
  store float %120, float addrspace(1)* %4, align 4, !tbaa !7
  br label %121

121:                                              ; preds = %110, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %16, label %122, label %124

122:                                              ; preds = %121
  %123 = load float, float addrspace(1)* %4, align 4, !tbaa !7
  store float %123, float addrspace(3)* @_ZZ24normalize_weights_kernelPfiS_S_S_PiE2u1, align 4, !tbaa !7
  br label %124

124:                                              ; preds = %122, %121
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %125, label %133

125:                                              ; preds = %124
  %126 = load float, float addrspace(3)* @_ZZ24normalize_weights_kernelPfiS_S_S_PiE2u1, align 4, !tbaa !7
  %127 = sitofp i32 %15 to float
  %128 = sitofp i32 %1 to float
  %129 = fdiv contract float %127, %128
  %130 = fadd contract float %129, %126
  %131 = sext i32 %15 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %4, i64 %131
  store float %130, float addrspace(1)* %132, align 4, !tbaa !7
  br label %133

133:                                              ; preds = %125, %124
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !9, i64 0}
