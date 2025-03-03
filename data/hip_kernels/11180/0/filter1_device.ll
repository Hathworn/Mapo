; ModuleID = '../data/hip_kernels/11180/0/main.cu'
source_filename = "../data/hip_kernels/11180/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7filter1iiPhS_(i32 %0, i32 %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp sgt i32 %13, 0
  %23 = icmp sgt i32 %21, 0
  %24 = select i1 %22, i1 %23, i1 false
  %25 = add nsw i32 %0, -1
  %26 = icmp slt i32 %13, %25
  %27 = select i1 %24, i1 %26, i1 false
  %28 = add nsw i32 %1, -1
  %29 = icmp slt i32 %21, %28
  %30 = select i1 %27, i1 %29, i1 false
  br i1 %30, label %31, label %142

31:                                               ; preds = %4
  %32 = mul nsw i32 %21, %0
  %33 = add i32 %32, %13
  %34 = mul i32 %33, 3
  %35 = add i32 %34, -3
  %36 = add nsw i32 %21, -1
  %37 = mul nsw i32 %36, %0
  %38 = add nsw i32 %37, %13
  %39 = mul nsw i32 %38, 3
  %40 = add i32 %34, 3
  %41 = add nuw nsw i32 %21, 1
  %42 = mul nsw i32 %41, %0
  %43 = add nsw i32 %42, %13
  %44 = mul nsw i32 %43, 3
  %45 = sext i32 %34 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %45
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !7
  %48 = zext i8 %47 to i16
  %49 = shl nuw nsw i16 %48, 2
  %50 = sext i32 %35 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7
  %53 = zext i8 %52 to i16
  %54 = sext i32 %39 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !7
  %57 = zext i8 %56 to i16
  %58 = sext i32 %40 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !7
  %61 = zext i8 %60 to i16
  %62 = sext i32 %44 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %62
  %64 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !7
  %65 = zext i8 %64 to i16
  %66 = add nuw nsw i16 %57, %53
  %67 = add nuw nsw i16 %66, %61
  %68 = add nuw nsw i16 %67, %65
  %69 = shl nuw nsw i16 %68, 1
  %70 = add nuw nsw i16 %69, %49
  %71 = udiv i16 %70, 12
  %72 = trunc i16 %71 to i8
  %73 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %45
  store i8 %72, i8 addrspace(1)* %73, align 1, !tbaa !7
  %74 = add nsw i32 %34, 1
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %75
  %77 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !7
  %78 = zext i8 %77 to i16
  %79 = shl nuw nsw i16 %78, 2
  %80 = add i32 %34, -2
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %81
  %83 = load i8, i8 addrspace(1)* %82, align 1, !tbaa !7
  %84 = zext i8 %83 to i16
  %85 = add nsw i32 %39, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %86
  %88 = load i8, i8 addrspace(1)* %87, align 1, !tbaa !7
  %89 = zext i8 %88 to i16
  %90 = add i32 %34, 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %91
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !7
  %94 = zext i8 %93 to i16
  %95 = add nsw i32 %44, 1
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %96
  %98 = load i8, i8 addrspace(1)* %97, align 1, !tbaa !7
  %99 = zext i8 %98 to i16
  %100 = add nuw nsw i16 %89, %84
  %101 = add nuw nsw i16 %100, %94
  %102 = add nuw nsw i16 %101, %99
  %103 = shl nuw nsw i16 %102, 1
  %104 = add nuw nsw i16 %103, %79
  %105 = udiv i16 %104, 12
  %106 = trunc i16 %105 to i8
  %107 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %75
  store i8 %106, i8 addrspace(1)* %107, align 1, !tbaa !7
  %108 = add nsw i32 %34, 2
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %109
  %111 = load i8, i8 addrspace(1)* %110, align 1, !tbaa !7
  %112 = zext i8 %111 to i16
  %113 = shl nuw nsw i16 %112, 2
  %114 = add i32 %34, -1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %115
  %117 = load i8, i8 addrspace(1)* %116, align 1, !tbaa !7
  %118 = zext i8 %117 to i16
  %119 = add nsw i32 %39, 2
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %120
  %122 = load i8, i8 addrspace(1)* %121, align 1, !tbaa !7
  %123 = zext i8 %122 to i16
  %124 = add i32 %34, 5
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %125
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !7
  %128 = zext i8 %127 to i16
  %129 = add nsw i32 %44, 2
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %130
  %132 = load i8, i8 addrspace(1)* %131, align 1, !tbaa !7
  %133 = zext i8 %132 to i16
  %134 = add nuw nsw i16 %123, %118
  %135 = add nuw nsw i16 %134, %128
  %136 = add nuw nsw i16 %135, %133
  %137 = shl nuw nsw i16 %136, 1
  %138 = add nuw nsw i16 %137, %113
  %139 = udiv i16 %138, 12
  %140 = trunc i16 %139 to i8
  %141 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %109
  store i8 %140, i8 addrspace(1)* %141, align 1, !tbaa !7
  br label %142

142:                                              ; preds = %31, %4
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
