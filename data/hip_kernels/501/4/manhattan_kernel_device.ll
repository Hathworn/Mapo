; ModuleID = '../data/hip_kernels/501/4/main.cu'
source_filename = "../data/hip_kernels/501/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16manhattan_kernelPKfmmS0_mmmPfmfE4temp = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16manhattan_kernelPKfmmS0_mmmPfmf(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readonly %3, i64 %4, i64 %5, i64 %6, float addrspace(1)* nocapture writeonly %7, i64 %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = icmp ult i64 %12, %2
  %16 = icmp ult i64 %14, %5
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %77

18:                                               ; preds = %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ16manhattan_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 %19
  store float 0.000000e+00, float addrspace(3)* %20, align 4, !tbaa !5
  %21 = zext i32 %19 to i64
  %22 = icmp ult i64 %21, %6
  br i1 %22, label %25, label %23

23:                                               ; preds = %18
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %34

25:                                               ; preds = %18
  %26 = mul i64 %12, %1
  %27 = mul i64 %14, %4
  %28 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %29 = getelementptr i8, i8 addrspace(4)* %28, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 4, !range !9, !invariant.load !10
  %32 = zext i16 %31 to i64
  br label %43

33:                                               ; preds = %43
  store float %54, float addrspace(3)* %20, align 4, !tbaa !5
  br label %34

34:                                               ; preds = %23, %33
  %35 = phi i8 addrspace(4)* [ %24, %23 ], [ %28, %33 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = getelementptr i8, i8 addrspace(4)* %35, i64 4
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 4, !range !9, !invariant.load !10
  %39 = icmp ult i16 %38, 2
  br i1 %39, label %57, label %40

40:                                               ; preds = %34
  %41 = lshr i16 %38, 1
  %42 = zext i16 %41 to i64
  br label %59

43:                                               ; preds = %25, %43
  %44 = phi float [ 0.000000e+00, %25 ], [ %54, %43 ]
  %45 = phi i64 [ %21, %25 ], [ %55, %43 ]
  %46 = add i64 %45, %26
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !10
  %49 = add i64 %45, %27
  %50 = getelementptr inbounds float, float addrspace(1)* %3, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !10
  %52 = fsub contract float %48, %51
  %53 = tail call float @llvm.fabs.f32(float %52)
  %54 = fadd contract float %44, %53
  %55 = add i64 %45, %32
  %56 = icmp ult i64 %55, %6
  br i1 %56, label %43, label %33, !llvm.loop !11

57:                                               ; preds = %69, %34
  %58 = icmp eq i32 %19, 0
  br i1 %58, label %72, label %77

59:                                               ; preds = %40, %69
  %60 = phi i64 [ %70, %69 ], [ %42, %40 ]
  %61 = icmp ugt i64 %60, %21
  br i1 %61, label %62, label %69

62:                                               ; preds = %59
  %63 = trunc i64 %60 to i32
  %64 = add nuw nsw i32 %19, %63
  %65 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ16manhattan_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 %64
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %67 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %68 = fadd contract float %66, %67
  store float %68, float addrspace(3)* %20, align 4, !tbaa !5
  br label %69

69:                                               ; preds = %62, %59
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = lshr i64 %60, 1
  %71 = icmp ult i64 %60, 2
  br i1 %71, label %57, label %59, !llvm.loop !13

72:                                               ; preds = %57
  %73 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16manhattan_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 0), align 16, !tbaa !5
  %74 = mul i64 %14, %8
  %75 = add i64 %74, %12
  %76 = getelementptr inbounds float, float addrspace(1)* %7, i64 %75
  store float %73, float addrspace(1)* %76, align 4, !tbaa !5
  br label %77

77:                                               ; preds = %57, %72, %10
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

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
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
