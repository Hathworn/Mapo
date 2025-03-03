; ModuleID = '../data/hip_kernels/14345/9/main.cu'
source_filename = "../data/hip_kernels/14345/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9reduceSumPiS_j(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = mul i32 %4, %2
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %2, %11
  %13 = mul i32 %12, %6
  %14 = sext i32 %5 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %16
  %18 = icmp sgt i32 %12, 1
  br i1 %18, label %19, label %88

19:                                               ; preds = %3
  %20 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7
  %21 = add i32 %12, -1
  %22 = add i32 %12, -2
  %23 = and i32 %21, 7
  %24 = icmp ult i32 %22, 7
  br i1 %24, label %73, label %25

25:                                               ; preds = %19
  %26 = and i32 %21, -8
  br label %27

27:                                               ; preds = %27, %25
  %28 = phi i32 [ %20, %25 ], [ %69, %27 ]
  %29 = phi i32 [ 1, %25 ], [ %70, %27 ]
  %30 = phi i32 [ 0, %25 ], [ %71, %27 ]
  %31 = zext i32 %29 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %34 = add nsw i32 %28, %33
  store i32 %34, i32 addrspace(1)* %17, align 4, !tbaa !7
  %35 = add nuw nsw i32 %29, 1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %39 = add nsw i32 %34, %38
  store i32 %39, i32 addrspace(1)* %17, align 4, !tbaa !7
  %40 = add nuw nsw i32 %29, 2
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = add nsw i32 %39, %43
  store i32 %44, i32 addrspace(1)* %17, align 4, !tbaa !7
  %45 = add nuw nsw i32 %29, 3
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = add nsw i32 %44, %48
  store i32 %49, i32 addrspace(1)* %17, align 4, !tbaa !7
  %50 = add nuw nsw i32 %29, 4
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7
  %54 = add nsw i32 %49, %53
  store i32 %54, i32 addrspace(1)* %17, align 4, !tbaa !7
  %55 = add nuw nsw i32 %29, 5
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7
  %59 = add nsw i32 %54, %58
  store i32 %59, i32 addrspace(1)* %17, align 4, !tbaa !7
  %60 = add nuw nsw i32 %29, 6
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %64 = add nsw i32 %59, %63
  store i32 %64, i32 addrspace(1)* %17, align 4, !tbaa !7
  %65 = add nuw nsw i32 %29, 7
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !7
  %69 = add nsw i32 %64, %68
  store i32 %69, i32 addrspace(1)* %17, align 4, !tbaa !7
  %70 = add nuw nsw i32 %29, 8
  %71 = add i32 %30, 8
  %72 = icmp eq i32 %71, %26
  br i1 %72, label %73, label %27, !llvm.loop !11

73:                                               ; preds = %27, %19
  %74 = phi i32 [ %20, %19 ], [ %69, %27 ]
  %75 = phi i32 [ 1, %19 ], [ %70, %27 ]
  %76 = icmp eq i32 %23, 0
  br i1 %76, label %88, label %77

77:                                               ; preds = %73, %77
  %78 = phi i32 [ %84, %77 ], [ %74, %73 ]
  %79 = phi i32 [ %85, %77 ], [ %75, %73 ]
  %80 = phi i32 [ %86, %77 ], [ 0, %73 ]
  %81 = zext i32 %79 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7
  %84 = add nsw i32 %78, %83
  store i32 %84, i32 addrspace(1)* %17, align 4, !tbaa !7
  %85 = add nuw nsw i32 %79, 1
  %86 = add i32 %80, 1
  %87 = icmp eq i32 %86, %23
  br i1 %87, label %88, label %77, !llvm.loop !13

88:                                               ; preds = %73, %77, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = icmp eq i32 %6, 0
  br i1 %89, label %90, label %167

90:                                               ; preds = %88
  %91 = zext i32 %4 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  store i32 0, i32 addrspace(1)* %92, align 4, !tbaa !7
  %93 = and i32 %11, 7
  %94 = icmp ult i16 %10, 8
  br i1 %94, label %151, label %95

95:                                               ; preds = %90
  %96 = and i32 %11, 2040
  br label %97

97:                                               ; preds = %97, %95
  %98 = phi i32 [ 0, %95 ], [ %147, %97 ]
  %99 = phi i32 [ 0, %95 ], [ %148, %97 ]
  %100 = phi i32 [ 0, %95 ], [ %149, %97 ]
  %101 = mul nsw i32 %99, %12
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %102
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !7
  %105 = add nsw i32 %98, %104
  store i32 %105, i32 addrspace(1)* %92, align 4, !tbaa !7
  %106 = or i32 %99, 1
  %107 = mul nsw i32 %106, %12
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %108
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !7
  %111 = add nsw i32 %105, %110
  store i32 %111, i32 addrspace(1)* %92, align 4, !tbaa !7
  %112 = or i32 %99, 2
  %113 = mul nsw i32 %112, %12
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !7
  %117 = add nsw i32 %111, %116
  store i32 %117, i32 addrspace(1)* %92, align 4, !tbaa !7
  %118 = or i32 %99, 3
  %119 = mul nsw i32 %118, %12
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !7
  %123 = add nsw i32 %117, %122
  store i32 %123, i32 addrspace(1)* %92, align 4, !tbaa !7
  %124 = or i32 %99, 4
  %125 = mul nsw i32 %124, %12
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %126
  %128 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !7
  %129 = add nsw i32 %123, %128
  store i32 %129, i32 addrspace(1)* %92, align 4, !tbaa !7
  %130 = or i32 %99, 5
  %131 = mul nsw i32 %130, %12
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %132
  %134 = load i32, i32 addrspace(1)* %133, align 4, !tbaa !7
  %135 = add nsw i32 %129, %134
  store i32 %135, i32 addrspace(1)* %92, align 4, !tbaa !7
  %136 = or i32 %99, 6
  %137 = mul nsw i32 %136, %12
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %138
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !7
  %141 = add nsw i32 %135, %140
  store i32 %141, i32 addrspace(1)* %92, align 4, !tbaa !7
  %142 = or i32 %99, 7
  %143 = mul nsw i32 %142, %12
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %144
  %146 = load i32, i32 addrspace(1)* %145, align 4, !tbaa !7
  %147 = add nsw i32 %141, %146
  store i32 %147, i32 addrspace(1)* %92, align 4, !tbaa !7
  %148 = add nuw nsw i32 %99, 8
  %149 = add i32 %100, 8
  %150 = icmp eq i32 %149, %96
  br i1 %150, label %151, label %97, !llvm.loop !15

151:                                              ; preds = %97, %90
  %152 = phi i32 [ 0, %90 ], [ %147, %97 ]
  %153 = phi i32 [ 0, %90 ], [ %148, %97 ]
  %154 = icmp eq i32 %93, 0
  br i1 %154, label %167, label %155

155:                                              ; preds = %151, %155
  %156 = phi i32 [ %163, %155 ], [ %152, %151 ]
  %157 = phi i32 [ %164, %155 ], [ %153, %151 ]
  %158 = phi i32 [ %165, %155 ], [ 0, %151 ]
  %159 = mul nsw i32 %157, %12
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %160
  %162 = load i32, i32 addrspace(1)* %161, align 4, !tbaa !7
  %163 = add nsw i32 %156, %162
  store i32 %163, i32 addrspace(1)* %92, align 4, !tbaa !7
  %164 = add nuw nsw i32 %157, 1
  %165 = add i32 %158, 1
  %166 = icmp eq i32 %165, %93
  br i1 %166, label %167, label %155, !llvm.loop !16

167:                                              ; preds = %151, %155, %88
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
