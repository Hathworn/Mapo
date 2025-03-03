; ModuleID = '../data/hip_kernels/317/2/main.cu'
source_filename = "../data/hip_kernels/317/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17nonMaxSuppressioniiiPhS_(i32 %0, i32 %1, i32 %2, i8 addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %1
  %24 = icmp slt i32 %22, %2
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %106

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %1
  %28 = add nsw i32 %27, %14
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %29
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !7, !amdgpu.noclobber !5
  switch i8 %31, label %106 [
    i8 0, label %32
    i8 45, label %50
    i8 90, label %70
    i8 -121, label %84
  ]

32:                                               ; preds = %26
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %29
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7, !amdgpu.noclobber !5
  %35 = add nsw i32 %22, 1
  %36 = mul nsw i32 %35, %1
  %37 = add nsw i32 %36, %14
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !7, !amdgpu.noclobber !5
  %41 = icmp ult i8 %34, %40
  br i1 %41, label %104, label %42

42:                                               ; preds = %32
  %43 = add nsw i32 %22, -1
  %44 = mul nsw i32 %43, %1
  %45 = add nsw i32 %44, %14
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7, !amdgpu.noclobber !5
  %49 = icmp ult i8 %34, %48
  br i1 %49, label %104, label %106

50:                                               ; preds = %26
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %29
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7, !amdgpu.noclobber !5
  %53 = add nsw i32 %22, 1
  %54 = mul nsw i32 %53, %1
  %55 = add nsw i32 %14, -1
  %56 = add i32 %55, %54
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !7, !amdgpu.noclobber !5
  %60 = icmp ult i8 %52, %59
  br i1 %60, label %104, label %61

61:                                               ; preds = %50
  %62 = add nsw i32 %22, -1
  %63 = mul nsw i32 %62, %1
  %64 = add nsw i32 %14, 1
  %65 = add i32 %64, %63
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7, !amdgpu.noclobber !5
  %69 = icmp ult i8 %52, %68
  br i1 %69, label %104, label %106

70:                                               ; preds = %26
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %29
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7, !amdgpu.noclobber !5
  %73 = add nsw i32 %28, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !7, !amdgpu.noclobber !5
  %77 = icmp ult i8 %72, %76
  br i1 %77, label %104, label %78

78:                                               ; preds = %70
  %79 = add nsw i32 %28, -1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7, !amdgpu.noclobber !5
  %83 = icmp ult i8 %72, %82
  br i1 %83, label %104, label %106

84:                                               ; preds = %26
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %29
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !7, !amdgpu.noclobber !5
  %87 = add nsw i32 %22, 1
  %88 = mul nsw i32 %87, %1
  %89 = add nsw i32 %14, 1
  %90 = add i32 %89, %88
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %91
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !7, !amdgpu.noclobber !5
  %94 = icmp ult i8 %86, %93
  br i1 %94, label %104, label %95

95:                                               ; preds = %84
  %96 = add nsw i32 %22, -1
  %97 = mul nsw i32 %96, %1
  %98 = add nsw i32 %14, -1
  %99 = add i32 %98, %97
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %100
  %102 = load i8, i8 addrspace(1)* %101, align 1, !tbaa !7, !amdgpu.noclobber !5
  %103 = icmp ult i8 %86, %102
  br i1 %103, label %104, label %106

104:                                              ; preds = %84, %95, %70, %78, %50, %61, %32, %42
  %105 = phi i8 addrspace(1)* [ %33, %42 ], [ %33, %32 ], [ %51, %61 ], [ %51, %50 ], [ %71, %78 ], [ %71, %70 ], [ %85, %95 ], [ %85, %84 ]
  store i8 0, i8 addrspace(1)* %105, align 1, !tbaa !7
  br label %106

106:                                              ; preds = %104, %42, %61, %78, %95, %26, %5
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
