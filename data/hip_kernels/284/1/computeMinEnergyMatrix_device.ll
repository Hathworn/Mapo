; ModuleID = '../data/hip_kernels/284/1/main.cu'
source_filename = "../data/hip_kernels/284/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_row_energy = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22computeMinEnergyMatrixPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %5, %11
  %13 = add i32 %12, %6
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %84

15:                                               ; preds = %4
  %16 = icmp slt i32 %6, %3
  br i1 %16, label %21, label %17

17:                                               ; preds = %21, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp sgt i32 %2, 1
  br i1 %18, label %19, label %84

19:                                               ; preds = %17
  %20 = add nsw i32 %3, -1
  br label %30

21:                                               ; preds = %15, %21
  %22 = phi i32 [ %28, %21 ], [ %6, %15 ]
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7
  %26 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_row_energy, i32 0, i32 %22
  store float %25, float addrspace(3)* %26, align 4, !tbaa !7
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  store float %25, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = add i32 %22, %11
  %29 = icmp slt i32 %28, %3
  br i1 %29, label %21, label %17, !llvm.loop !11

30:                                               ; preds = %19, %70
  %31 = phi i32 [ 1, %19 ], [ %71, %70 ]
  %32 = phi <4 x float> [ undef, %19 ], [ %36, %70 ]
  br i1 %16, label %33, label %35

33:                                               ; preds = %30
  %34 = mul nsw i32 %31, %3
  br label %39

35:                                               ; preds = %57, %30
  %36 = phi <4 x float> [ %32, %30 ], [ %67, %57 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %16, label %37, label %70

37:                                               ; preds = %35
  %38 = mul nsw i32 %31, %3
  br label %73

39:                                               ; preds = %33, %57
  %40 = phi i32 [ 0, %33 ], [ %66, %57 ]
  %41 = phi i32 [ %6, %33 ], [ %68, %57 ]
  %42 = phi <4 x float> [ %32, %33 ], [ %67, %57 ]
  %43 = icmp eq i32 %41, 0
  br i1 %43, label %48, label %44

44:                                               ; preds = %39
  %45 = add nsw i32 %41, -1
  %46 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_row_energy, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  br label %48

48:                                               ; preds = %39, %44
  %49 = phi contract float [ %47, %44 ], [ 1.000000e+09, %39 ]
  %50 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_row_energy, i32 0, i32 %41
  %51 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %52 = icmp eq i32 %41, %20
  br i1 %52, label %57, label %53

53:                                               ; preds = %48
  %54 = add nsw i32 %41, 1
  %55 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_row_energy, i32 0, i32 %54
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  br label %57

57:                                               ; preds = %48, %53
  %58 = phi contract float [ %56, %53 ], [ 1.000000e+09, %48 ]
  %59 = add nsw i32 %41, %34
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = tail call float @llvm.minnum.f32(float %51, float %58)
  %64 = tail call float @llvm.minnum.f32(float %49, float %63)
  %65 = fadd contract float %62, %64
  %66 = add nuw nsw i32 %40, 1
  %67 = insertelement <4 x float> %42, float %65, i32 %40
  %68 = add i32 %41, %11
  %69 = icmp slt i32 %68, %3
  br i1 %69, label %39, label %35, !llvm.loop !13

70:                                               ; preds = %73, %35
  %71 = add nuw nsw i32 %31, 1
  %72 = icmp eq i32 %71, %2
  br i1 %72, label %84, label %30, !llvm.loop !14

73:                                               ; preds = %37, %73
  %74 = phi i32 [ %6, %37 ], [ %82, %73 ]
  %75 = phi i32 [ 0, %37 ], [ %78, %73 ]
  %76 = extractelement <4 x float> %36, i32 %75
  %77 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_row_energy, i32 0, i32 %74
  store float %76, float addrspace(3)* %77, align 4, !tbaa !7
  %78 = add nuw nsw i32 %75, 1
  %79 = add nsw i32 %74, %38
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  store float %76, float addrspace(1)* %81, align 4, !tbaa !7
  %82 = add i32 %74, %11
  %83 = icmp slt i32 %82, %3
  br i1 %83, label %73, label %70, !llvm.loop !15

84:                                               ; preds = %70, %17, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
