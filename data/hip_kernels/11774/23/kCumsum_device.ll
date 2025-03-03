; ModuleID = '../data/hip_kernels/11774/23/main.cu'
source_filename = "../data/hip_kernels/11774/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7kCumsumPfS_S_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = shl nuw nsw i32 %5, 1
  %7 = icmp ult i32 %6, %3
  br i1 %7, label %8, label %84

8:                                                ; preds = %4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %3
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %1, i64 %11
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %14 = getelementptr inbounds float, float addrspace(1)* %2, i64 %11
  %15 = zext i32 %6 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %13, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = getelementptr inbounds float, float addrspace(1)* %14, i64 %15
  store float %17, float addrspace(1)* %18, align 4, !tbaa !5
  %19 = add nuw nsw i32 %6, 1
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %13, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5
  %23 = getelementptr inbounds float, float addrspace(1)* %14, i64 %20
  store float %22, float addrspace(1)* %23, align 4, !tbaa !5
  %24 = icmp ult i32 %3, 2
  br i1 %24, label %27, label %25

25:                                               ; preds = %8
  %26 = add nuw nsw i32 %6, 2
  br label %30

27:                                               ; preds = %47, %8
  %28 = phi i32 [ 1, %8 ], [ %48, %47 ]
  %29 = icmp eq i32 %5, 0
  br i1 %29, label %50, label %54

30:                                               ; preds = %25, %47
  %31 = phi i32 [ %3, %25 ], [ %33, %47 ]
  %32 = phi i32 [ 1, %25 ], [ %48, %47 ]
  %33 = lshr i32 %31, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp ult i32 %5, %33
  br i1 %34, label %35, label %47

35:                                               ; preds = %30
  %36 = mul nsw i32 %32, %19
  %37 = add nsw i32 %36, -1
  %38 = mul nsw i32 %32, %26
  %39 = add nsw i32 %38, -1
  %40 = sext i32 %37 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %14, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5
  %43 = sext i32 %39 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %14, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5
  %46 = fadd contract float %42, %45
  store float %46, float addrspace(1)* %44, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %30, %35
  %48 = shl nsw i32 %32, 1
  %49 = icmp ult i32 %31, 4
  br i1 %49, label %27, label %30, !llvm.loop !10

50:                                               ; preds = %27
  %51 = add i32 %3, -1
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %14, i64 %52
  store float 0.000000e+00, float addrspace(1)* %53, align 4, !tbaa !5
  br label %54

54:                                               ; preds = %50, %27
  %55 = icmp ugt i32 %3, 1
  br i1 %55, label %56, label %58

56:                                               ; preds = %54
  %57 = add nuw nsw i32 %6, 2
  br label %63

58:                                               ; preds = %81, %54
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = load float, float addrspace(1)* %18, align 4, !tbaa !5
  %60 = getelementptr inbounds float, float addrspace(1)* %12, i64 %15
  store float %59, float addrspace(1)* %60, align 4, !tbaa !5
  %61 = load float, float addrspace(1)* %23, align 4, !tbaa !5
  %62 = getelementptr inbounds float, float addrspace(1)* %12, i64 %20
  store float %61, float addrspace(1)* %62, align 4, !tbaa !5
  br label %84

63:                                               ; preds = %56, %81
  %64 = phi i32 [ 1, %56 ], [ %82, %81 ]
  %65 = phi i32 [ %28, %56 ], [ %66, %81 ]
  %66 = lshr i32 %65, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %67 = icmp slt i32 %5, %64
  br i1 %67, label %68, label %81

68:                                               ; preds = %63
  %69 = mul nsw i32 %66, %19
  %70 = add nsw i32 %69, -1
  %71 = mul nsw i32 %66, %57
  %72 = add nsw i32 %71, -1
  %73 = sext i32 %70 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %14, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5
  %76 = sext i32 %72 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %14, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  store float %78, float addrspace(1)* %74, align 4, !tbaa !5
  %79 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  %80 = fadd contract float %75, %79
  store float %80, float addrspace(1)* %77, align 4, !tbaa !5
  br label %81

81:                                               ; preds = %63, %68
  %82 = shl nsw i32 %64, 1
  %83 = icmp ult i32 %82, %3
  br i1 %83, label %63, label %58, !llvm.loop !12

84:                                               ; preds = %58, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
