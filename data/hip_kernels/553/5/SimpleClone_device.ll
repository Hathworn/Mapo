; ModuleID = '../data/hip_kernels/553/5/main.cu'
source_filename = "../data/hip_kernels/553/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11SimpleClonePKfS0_PKiPfiiiiii(float addrspace(1)* nocapture readnone %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %27 = add i32 %25, %26
  %28 = mul nsw i32 %19, %6
  %29 = add nsw i32 %28, %27
  %30 = icmp slt i32 %19, %7
  %31 = icmp slt i32 %27, %6
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %72

33:                                               ; preds = %10
  %34 = sext i32 %29 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %72, label %38

38:                                               ; preds = %33
  %39 = add nsw i32 %19, %8
  %40 = add nsw i32 %27, %9
  %41 = mul nsw i32 %39, %4
  %42 = add nsw i32 %41, %40
  %43 = icmp sgt i32 %39, -1
  br i1 %43, label %44, label %72

44:                                               ; preds = %38
  %45 = icmp slt i32 %39, %5
  %46 = icmp sgt i32 %40, -1
  %47 = select i1 %45, i1 %46, i1 false
  %48 = icmp slt i32 %40, %4
  %49 = select i1 %47, i1 %48, i1 false
  br i1 %49, label %50, label %72

50:                                               ; preds = %44
  %51 = mul nsw i32 %29, 3
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !11, !amdgpu.noclobber !5
  %55 = mul nsw i32 %42, 3
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  store float %54, float addrspace(1)* %57, align 4, !tbaa !11
  %58 = add nsw i32 %51, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !11
  %62 = add nsw i32 %55, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %3, i64 %63
  store float %61, float addrspace(1)* %64, align 4, !tbaa !11
  %65 = add nsw i32 %51, 2
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !11
  %69 = add nsw i32 %55, 2
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %3, i64 %70
  store float %68, float addrspace(1)* %71, align 4, !tbaa !11
  br label %72

72:                                               ; preds = %38, %44, %50, %33, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
