; ModuleID = '../data/hip_kernels/18086/6/main.cu'
source_filename = "../data/hip_kernels/18086/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15cuda_copyRegionPhS_iiiiiiiiiiiiiii(i8 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16) local_unnamed_addr #0 {
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %19, %24
  %26 = add i32 %25, %18
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %29 = getelementptr i8, i8 addrspace(4)* %20, i64 6
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 2, !range !5, !invariant.load !6
  %32 = zext i16 %31 to i32
  %33 = mul i32 %28, %32
  %34 = add i32 %33, %27
  %35 = add nsw i32 %26, %8
  %36 = add nsw i32 %34, %9
  %37 = add nsw i32 %26, %12
  %38 = add nsw i32 %34, %13
  %39 = icmp slt i32 %34, %11
  %40 = icmp slt i32 %26, %10
  %41 = select i1 %39, i1 %40, i1 false
  %42 = icmp slt i32 %35, %4
  %43 = select i1 %41, i1 %42, i1 false
  %44 = icmp slt i32 %36, %5
  %45 = select i1 %43, i1 %44, i1 false
  br i1 %45, label %46, label %81

46:                                               ; preds = %17
  switch i32 %16, label %81 [
    i32 1, label %47
    i32 3, label %52
  ]

47:                                               ; preds = %46
  %48 = mul nsw i32 %38, %3
  %49 = add nsw i32 %48, %37
  %50 = mul nsw i32 %36, %2
  %51 = add nsw i32 %50, %35
  br label %73

52:                                               ; preds = %46
  %53 = mul nsw i32 %36, %2
  %54 = add nsw i32 %53, %35
  %55 = mul nsw i32 %38, %3
  %56 = add nsw i32 %55, %37
  %57 = mul nsw i32 %56, 3
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !7, !amdgpu.noclobber !6
  %61 = mul nsw i32 %54, 3
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %62
  store i8 %60, i8 addrspace(1)* %63, align 1, !tbaa !7
  %64 = add nsw i32 %57, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %65
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !7
  %68 = add nsw i32 %61, 1
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %69
  store i8 %67, i8 addrspace(1)* %70, align 1, !tbaa !7
  %71 = add nsw i32 %57, 2
  %72 = add nsw i32 %61, 2
  br label %73

73:                                               ; preds = %52, %47
  %74 = phi i32 [ %51, %47 ], [ %72, %52 ]
  %75 = phi i32 [ %49, %47 ], [ %71, %52 ]
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %76
  %78 = load i8, i8 addrspace(1)* %77, align 1, !tbaa !7
  %79 = sext i32 %74 to i64
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %79
  store i8 %78, i8 addrspace(1)* %80, align 1, !tbaa !7
  br label %81

81:                                               ; preds = %73, %46, %17
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
