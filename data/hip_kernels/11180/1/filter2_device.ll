; ModuleID = '../data/hip_kernels/11180/1/main.cu'
source_filename = "../data/hip_kernels/11180/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7filter2iiPhS_(i32 %0, i32 %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
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
  br i1 %30, label %31, label %152

31:                                               ; preds = %4
  %32 = add nsw i32 %21, -1
  %33 = add nsw i32 %13, -1
  %34 = mul nsw i32 %21, %0
  %35 = add i32 %34, %13
  %36 = mul nsw i32 %35, 3
  %37 = add nuw nsw i32 %13, 1
  %38 = mul nsw i32 %32, %0
  %39 = add i32 %33, %34
  %40 = mul nsw i32 %39, 3
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !7
  %44 = zext i8 %43 to i16
  %45 = add nuw nsw i32 %21, 1
  %46 = mul nsw i32 %45, %0
  %47 = add i32 %13, %38
  %48 = mul nsw i32 %47, 3
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %49
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !7
  %52 = zext i8 %51 to i16
  %53 = add nuw nsw i16 %52, %44
  %54 = shl nuw nsw i16 %53, 1
  %55 = sext i32 %36 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !7
  %58 = zext i8 %57 to i16
  %59 = shl nuw nsw i16 %58, 2
  %60 = add nuw nsw i16 %59, %54
  %61 = add i32 %13, %46
  %62 = mul nsw i32 %61, 3
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7
  %66 = zext i8 %65 to i16
  %67 = shl nuw nsw i16 %66, 1
  %68 = add nuw nsw i16 %67, %60
  %69 = add i32 %37, %34
  %70 = mul nsw i32 %69, 3
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %71
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !7
  %74 = zext i8 %73 to i16
  %75 = shl nuw nsw i16 %74, 1
  %76 = add nuw nsw i16 %75, %68
  %77 = udiv i16 %76, 12
  %78 = trunc i16 %77 to i8
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %55
  store i8 %78, i8 addrspace(1)* %79, align 1, !tbaa !7
  %80 = add nsw i32 %40, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %81
  %83 = load i8, i8 addrspace(1)* %82, align 1, !tbaa !7
  %84 = zext i8 %83 to i16
  %85 = add nsw i32 %48, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %86
  %88 = load i8, i8 addrspace(1)* %87, align 1, !tbaa !7
  %89 = zext i8 %88 to i16
  %90 = add nuw nsw i16 %89, %84
  %91 = shl nuw nsw i16 %90, 1
  %92 = add nsw i32 %36, 1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %93
  %95 = load i8, i8 addrspace(1)* %94, align 1, !tbaa !7
  %96 = zext i8 %95 to i16
  %97 = shl nuw nsw i16 %96, 2
  %98 = add nuw nsw i16 %97, %91
  %99 = add nsw i32 %62, 1
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %100
  %102 = load i8, i8 addrspace(1)* %101, align 1, !tbaa !7
  %103 = zext i8 %102 to i16
  %104 = shl nuw nsw i16 %103, 1
  %105 = add nuw nsw i16 %104, %98
  %106 = add nsw i32 %70, 1
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %107
  %109 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !7
  %110 = zext i8 %109 to i16
  %111 = shl nuw nsw i16 %110, 1
  %112 = add nuw nsw i16 %111, %105
  %113 = udiv i16 %112, 12
  %114 = trunc i16 %113 to i8
  %115 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %93
  store i8 %114, i8 addrspace(1)* %115, align 1, !tbaa !7
  %116 = add nsw i32 %40, 2
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %117
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !7
  %120 = zext i8 %119 to i16
  %121 = add nsw i32 %48, 2
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %122
  %124 = load i8, i8 addrspace(1)* %123, align 1, !tbaa !7
  %125 = zext i8 %124 to i16
  %126 = add nuw nsw i16 %125, %120
  %127 = shl nuw nsw i16 %126, 1
  %128 = add nsw i32 %36, 2
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %129
  %131 = load i8, i8 addrspace(1)* %130, align 1, !tbaa !7
  %132 = zext i8 %131 to i16
  %133 = shl nuw nsw i16 %132, 2
  %134 = add nuw nsw i16 %133, %127
  %135 = add nsw i32 %62, 2
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %136
  %138 = load i8, i8 addrspace(1)* %137, align 1, !tbaa !7
  %139 = zext i8 %138 to i16
  %140 = shl nuw nsw i16 %139, 1
  %141 = add nuw nsw i16 %140, %134
  %142 = add nsw i32 %70, 2
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %143
  %145 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !7
  %146 = zext i8 %145 to i16
  %147 = shl nuw nsw i16 %146, 1
  %148 = add nuw nsw i16 %147, %141
  %149 = udiv i16 %148, 12
  %150 = trunc i16 %149 to i8
  %151 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %129
  store i8 %150, i8 addrspace(1)* %151, align 1, !tbaa !7
  br label %152

152:                                              ; preds = %31, %4
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
