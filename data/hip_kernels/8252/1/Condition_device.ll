; ModuleID = '../data/hip_kernels/8252/1/main.cu'
source_filename = "../data/hip_kernels/8252/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9ConditionPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = add i32 %8, %9
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = shl i32 %11, 5
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = add i32 %12, %13
  %15 = icmp sgt i32 %14, 0
  %16 = icmp sgt i32 %10, 0
  %17 = select i1 %15, i1 %16, i1 false
  %18 = add nsw i32 %3, -1
  %19 = icmp slt i32 %14, %18
  %20 = select i1 %17, i1 %19, i1 false
  %21 = add nsw i32 %4, -1
  %22 = icmp slt i32 %10, %21
  %23 = select i1 %20, i1 %22, i1 false
  br i1 %23, label %24, label %145

24:                                               ; preds = %6
  %25 = mul nsw i32 %14, %4
  %26 = add nsw i32 %25, %10
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %27
  store i32 0, i32 addrspace(1)* %28, align 4, !tbaa !5
  %29 = add nsw i32 %14, -1
  %30 = mul nsw i32 %29, %4
  %31 = add nsw i32 %10, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5
  %35 = add nuw nsw i32 %10, 1
  %36 = add nsw i32 %35, %30
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !5
  %40 = add nsw i32 %39, %34
  %41 = add nsw i32 %35, %25
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !5
  %45 = add nsw i32 %44, %40
  %46 = add nuw nsw i32 %14, 1
  %47 = mul nsw i32 %46, %4
  %48 = add nsw i32 %35, %47
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !5
  %52 = add nsw i32 %51, %45
  %53 = add nsw i32 %10, %47
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !5
  %57 = add nsw i32 %56, %52
  %58 = add nsw i32 %10, -1
  %59 = add nsw i32 %58, %47
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5
  %63 = add nsw i32 %62, %57
  %64 = add nsw i32 %58, %25
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !5
  %68 = add nsw i32 %67, %63
  %69 = add nsw i32 %58, %30
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !5
  %73 = add nsw i32 %72, %68
  %74 = icmp eq i32 %34, 0
  %75 = icmp eq i32 %39, 1
  %76 = select i1 %74, i1 %75, i1 false
  %77 = zext i1 %76 to i32
  %78 = icmp eq i32 %39, 0
  %79 = icmp eq i32 %44, 1
  %80 = select i1 %78, i1 %79, i1 false
  %81 = zext i1 %80 to i32
  %82 = add nuw nsw i32 %77, %81
  %83 = icmp eq i32 %44, 0
  %84 = icmp eq i32 %51, 1
  %85 = select i1 %83, i1 %84, i1 false
  %86 = zext i1 %85 to i32
  %87 = add nuw nsw i32 %82, %86
  %88 = icmp eq i32 %51, 0
  %89 = icmp eq i32 %56, 1
  %90 = select i1 %88, i1 %89, i1 false
  %91 = zext i1 %90 to i32
  %92 = add nuw nsw i32 %87, %91
  %93 = icmp eq i32 %56, 0
  %94 = icmp eq i32 %62, 1
  %95 = select i1 %93, i1 %94, i1 false
  %96 = zext i1 %95 to i32
  %97 = add nuw nsw i32 %92, %96
  %98 = icmp eq i32 %62, 0
  %99 = icmp eq i32 %67, 1
  %100 = select i1 %98, i1 %99, i1 false
  %101 = zext i1 %100 to i32
  %102 = add nuw nsw i32 %97, %101
  %103 = icmp eq i32 %67, 0
  %104 = icmp eq i32 %72, 1
  %105 = select i1 %103, i1 %104, i1 false
  %106 = zext i1 %105 to i32
  %107 = add nuw nsw i32 %102, %106
  %108 = icmp eq i32 %72, 0
  %109 = icmp eq i32 %34, 1
  %110 = select i1 %108, i1 %109, i1 false
  %111 = zext i1 %110 to i32
  %112 = add nuw nsw i32 %107, %111
  %113 = icmp eq i32 %5, 1
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !5
  %116 = icmp eq i32 %115, 1
  %117 = icmp sgt i32 %73, 1
  %118 = select i1 %116, i1 %117, i1 false
  %119 = icmp slt i32 %73, 7
  %120 = select i1 %118, i1 %119, i1 false
  %121 = icmp eq i32 %112, 1
  %122 = select i1 %120, i1 %121, i1 false
  br i1 %113, label %133, label %123

123:                                              ; preds = %24
  br i1 %122, label %124, label %145

124:                                              ; preds = %123
  %125 = mul i32 %56, %44
  %126 = mul i32 %125, %34
  %127 = icmp eq i32 %126, 0
  %128 = mul nsw i32 %125, %67
  %129 = icmp eq i32 %128, 0
  %130 = select i1 %127, i1 %129, i1 false
  br i1 %130, label %131, label %145

131:                                              ; preds = %124
  store i32 1, i32 addrspace(1)* %28, align 4, !tbaa !5
  %132 = sext i32 %5 to i64
  br label %142

133:                                              ; preds = %24
  br i1 %122, label %134, label %145

134:                                              ; preds = %133
  %135 = mul i32 %67, %34
  %136 = mul i32 %135, %44
  %137 = icmp eq i32 %136, 0
  %138 = mul i32 %135, %56
  %139 = icmp eq i32 %138, 0
  %140 = select i1 %137, i1 %139, i1 false
  br i1 %140, label %141, label %145

141:                                              ; preds = %134
  store i32 1, i32 addrspace(1)* %28, align 4, !tbaa !5
  br label %142

142:                                              ; preds = %141, %131
  %143 = phi i64 [ %132, %131 ], [ 1, %141 ]
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %143
  store i32 1, i32 addrspace(1)* %144, align 4, !tbaa !5
  br label %145

145:                                              ; preds = %142, %124, %123, %134, %133, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
