; ModuleID = '../data/hip_kernels/1976/0/main.cu'
source_filename = "../data/hip_kernels/1976/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18convolution1KernelPiS_iiS_(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp sgt i32 %14, 0
  %24 = icmp sgt i32 %22, 0
  %25 = select i1 %23, i1 %24, i1 false
  %26 = add nsw i32 %2, -1
  %27 = icmp slt i32 %14, %26
  %28 = select i1 %25, i1 %27, i1 false
  %29 = add nsw i32 %3, -1
  %30 = icmp slt i32 %22, %29
  %31 = select i1 %28, i1 %30, i1 false
  br i1 %31, label %32, label %114

32:                                               ; preds = %5
  %33 = add nsw i32 %22, -1
  %34 = add nsw i32 %14, -1
  %35 = mul nsw i32 %22, %3
  %36 = add nsw i32 %35, %14
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = mul nsw i32 %33, %3
  %40 = add i32 %34, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !7
  %45 = mul nsw i32 %44, %43
  %46 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7
  %47 = add nsw i32 %46, %45
  store i32 %47, i32 addrspace(1)* %38, align 4, !tbaa !7
  %48 = add i32 %14, %39
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 1
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7
  %54 = mul nsw i32 %53, %51
  %55 = add nsw i32 %47, %54
  store i32 %55, i32 addrspace(1)* %38, align 4, !tbaa !7
  %56 = add i32 %40, 2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 2
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7
  %62 = mul nsw i32 %61, %59
  %63 = add nsw i32 %55, %62
  store i32 %63, i32 addrspace(1)* %38, align 4, !tbaa !7
  %64 = add i32 %34, %35
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 3
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = mul nsw i32 %69, %67
  %71 = add nsw i32 %63, %70
  store i32 %71, i32 addrspace(1)* %38, align 4, !tbaa !7
  %72 = add i32 %14, %35
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 4
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !7
  %78 = mul nsw i32 %77, %75
  %79 = add nsw i32 %71, %78
  store i32 %79, i32 addrspace(1)* %38, align 4, !tbaa !7
  %80 = add i32 %64, 2
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 5
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7
  %86 = mul nsw i32 %85, %83
  %87 = add nsw i32 %79, %86
  store i32 %87, i32 addrspace(1)* %38, align 4, !tbaa !7
  %88 = add nuw nsw i32 %22, 1
  %89 = mul nsw i32 %88, %3
  %90 = add i32 %34, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 6
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %96 = mul nsw i32 %95, %93
  %97 = add nsw i32 %87, %96
  store i32 %97, i32 addrspace(1)* %38, align 4, !tbaa !7
  %98 = add i32 %14, %89
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 7
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7
  %104 = mul nsw i32 %103, %101
  %105 = add nsw i32 %97, %104
  store i32 %105, i32 addrspace(1)* %38, align 4, !tbaa !7
  %106 = add i32 %90, 2
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !7
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 8
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7
  %112 = mul nsw i32 %111, %109
  %113 = add nsw i32 %105, %112
  store i32 %113, i32 addrspace(1)* %38, align 4, !tbaa !7
  br label %114

114:                                              ; preds = %32, %5
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
