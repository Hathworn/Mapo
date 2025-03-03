; ModuleID = '../data/hip_kernels/11130/11/main.cu'
source_filename = "../data/hip_kernels/11130/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15calcularBloquesPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = icmp sgt i32 %3, 0
  br i1 %24, label %25, label %36

25:                                               ; preds = %6
  %26 = icmp sgt i32 %4, 0
  %27 = mul nsw i32 %15, %4
  %28 = and i32 %4, 7
  %29 = icmp ult i32 %4, 8
  %30 = and i32 %4, -8
  %31 = icmp eq i32 %28, 0
  br label %32

32:                                               ; preds = %25, %60
  %33 = phi i32 [ 0, %25 ], [ %67, %60 ]
  %34 = mul nsw i32 %33, %4
  br i1 %26, label %35, label %60

35:                                               ; preds = %32
  br i1 %29, label %37, label %69

36:                                               ; preds = %60, %6
  ret void

37:                                               ; preds = %69, %35
  %38 = phi i32 [ undef, %35 ], [ %175, %69 ]
  %39 = phi i32 [ 0, %35 ], [ %176, %69 ]
  %40 = phi i32 [ 0, %35 ], [ %175, %69 ]
  br i1 %31, label %60, label %41

41:                                               ; preds = %37, %41
  %42 = phi i32 [ %57, %41 ], [ %39, %37 ]
  %43 = phi i32 [ %56, %41 ], [ %40, %37 ]
  %44 = phi i32 [ %58, %41 ], [ 0, %37 ]
  %45 = add nsw i32 %42, %27
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = add nsw i32 %42, %34
  %50 = mul nsw i32 %49, %5
  %51 = add nsw i32 %50, %23
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7
  %55 = mul nsw i32 %54, %48
  %56 = add nsw i32 %55, %43
  %57 = add nuw nsw i32 %42, 1
  %58 = add i32 %44, 1
  %59 = icmp eq i32 %58, %28
  br i1 %59, label %60, label %41, !llvm.loop !11

60:                                               ; preds = %37, %41, %32
  %61 = phi i32 [ 0, %32 ], [ %38, %37 ], [ %56, %41 ]
  %62 = add nsw i32 %34, %15
  %63 = mul nsw i32 %62, %5
  %64 = add nsw i32 %63, %23
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %65
  store i32 %61, i32 addrspace(1)* %66, align 4, !tbaa !7
  %67 = add nuw nsw i32 %33, 1
  %68 = icmp eq i32 %67, %3
  br i1 %68, label %36, label %32, !llvm.loop !13

69:                                               ; preds = %35, %69
  %70 = phi i32 [ %176, %69 ], [ 0, %35 ]
  %71 = phi i32 [ %175, %69 ], [ 0, %35 ]
  %72 = phi i32 [ %177, %69 ], [ 0, %35 ]
  %73 = add nsw i32 %70, %27
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7
  %77 = add nsw i32 %70, %34
  %78 = mul nsw i32 %77, %5
  %79 = add nsw i32 %78, %23
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7
  %83 = mul nsw i32 %82, %76
  %84 = add nsw i32 %83, %71
  %85 = or i32 %70, 1
  %86 = add nsw i32 %85, %27
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !7
  %90 = add nsw i32 %85, %34
  %91 = mul nsw i32 %90, %5
  %92 = add nsw i32 %91, %23
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %96 = mul nsw i32 %95, %89
  %97 = add nsw i32 %96, %84
  %98 = or i32 %70, 2
  %99 = add nsw i32 %98, %27
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !7
  %103 = add nsw i32 %98, %34
  %104 = mul nsw i32 %103, %5
  %105 = add nsw i32 %104, %23
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !7
  %109 = mul nsw i32 %108, %102
  %110 = add nsw i32 %109, %97
  %111 = or i32 %70, 3
  %112 = add nsw i32 %111, %27
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !7
  %116 = add nsw i32 %111, %34
  %117 = mul nsw i32 %116, %5
  %118 = add nsw i32 %117, %23
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !7
  %122 = mul nsw i32 %121, %115
  %123 = add nsw i32 %122, %110
  %124 = or i32 %70, 4
  %125 = add nsw i32 %124, %27
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %126
  %128 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !7
  %129 = add nsw i32 %124, %34
  %130 = mul nsw i32 %129, %5
  %131 = add nsw i32 %130, %23
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %132
  %134 = load i32, i32 addrspace(1)* %133, align 4, !tbaa !7
  %135 = mul nsw i32 %134, %128
  %136 = add nsw i32 %135, %123
  %137 = or i32 %70, 5
  %138 = add nsw i32 %137, %27
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %139
  %141 = load i32, i32 addrspace(1)* %140, align 4, !tbaa !7
  %142 = add nsw i32 %137, %34
  %143 = mul nsw i32 %142, %5
  %144 = add nsw i32 %143, %23
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %145
  %147 = load i32, i32 addrspace(1)* %146, align 4, !tbaa !7
  %148 = mul nsw i32 %147, %141
  %149 = add nsw i32 %148, %136
  %150 = or i32 %70, 6
  %151 = add nsw i32 %150, %27
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %152
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !7
  %155 = add nsw i32 %150, %34
  %156 = mul nsw i32 %155, %5
  %157 = add nsw i32 %156, %23
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %158
  %160 = load i32, i32 addrspace(1)* %159, align 4, !tbaa !7
  %161 = mul nsw i32 %160, %154
  %162 = add nsw i32 %161, %149
  %163 = or i32 %70, 7
  %164 = add nsw i32 %163, %27
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %165
  %167 = load i32, i32 addrspace(1)* %166, align 4, !tbaa !7
  %168 = add nsw i32 %163, %34
  %169 = mul nsw i32 %168, %5
  %170 = add nsw i32 %169, %23
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %171
  %173 = load i32, i32 addrspace(1)* %172, align 4, !tbaa !7
  %174 = mul nsw i32 %173, %167
  %175 = add nsw i32 %174, %162
  %176 = add nuw nsw i32 %70, 8
  %177 = add i32 %72, 8
  %178 = icmp eq i32 %177, %30
  br i1 %178, label %37, label %69, !llvm.loop !15
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
