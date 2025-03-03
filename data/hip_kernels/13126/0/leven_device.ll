; ModuleID = '../data/hip_kernels/13126/0/main.cu'
source_filename = "../data/hip_kernels/13126/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @leven(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %13, 0
  %15 = icmp slt i32 %13, %3
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %167

17:                                               ; preds = %4
  %18 = trunc i32 %13 to i8
  store i8 %18, i8 addrspace(1)* %2, align 1, !tbaa !7
  %19 = add nsw i32 %13, -1
  %20 = icmp slt i32 %3, 1
  br i1 %20, label %167, label %21

21:                                               ; preds = %17
  %22 = zext i32 %19 to i64
  %23 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %22
  %24 = load i8, i8 addrspace(1)* %2, align 1
  %25 = and i32 %3, 3
  %26 = icmp ult i32 %3, 4
  br i1 %26, label %131, label %27

27:                                               ; preds = %21
  %28 = and i32 %3, -4
  br label %29

29:                                               ; preds = %29, %27
  %30 = phi i8 [ %24, %27 ], [ %125, %29 ]
  %31 = phi i32 [ %19, %27 ], [ %124, %29 ]
  %32 = phi i32 [ 1, %27 ], [ %126, %29 ]
  %33 = phi i32 [ 0, %27 ], [ %127, %29 ]
  %34 = zext i32 %32 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !7
  %37 = add nsw i32 %32, -1
  %38 = sext i32 %37 to i64
  %39 = tail call i8 @llvm.smin.i8(i8 %36, i8 %30)
  %40 = sext i8 %39 to i32
  %41 = add nsw i32 %40, 1
  %42 = load i8, i8 addrspace(1)* %23, align 1, !tbaa !7
  %43 = sext i8 %42 to i32
  %44 = icmp slt i32 %41, %43
  %45 = zext i1 %44 to i32
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %38
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !7
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %45, %48
  %50 = icmp eq i32 %31, -1
  %51 = icmp eq i8 %42, %47
  %52 = select i1 %51, i32 255, i32 0
  %53 = select i1 %50, i32 %52, i32 %41
  %54 = select i1 %49, i32 %31, i32 %53
  %55 = zext i8 %36 to i32
  %56 = trunc i32 %54 to i8
  store i8 %56, i8 addrspace(1)* %35, align 1, !tbaa !7
  %57 = add nuw nsw i32 %32, 1
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !7
  %61 = sext i32 %32 to i64
  %62 = tail call i8 @llvm.smin.i8(i8 %60, i8 %56)
  %63 = sext i8 %62 to i32
  %64 = add nsw i32 %63, 1
  %65 = load i8, i8 addrspace(1)* %23, align 1, !tbaa !7
  %66 = sext i8 %65 to i32
  %67 = icmp slt i32 %64, %66
  %68 = zext i1 %67 to i32
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %61
  %70 = load i8, i8 addrspace(1)* %69, align 1, !tbaa !7
  %71 = sext i8 %70 to i32
  %72 = icmp eq i32 %68, %71
  %73 = icmp eq i8 %36, -1
  %74 = icmp eq i8 %65, %70
  %75 = select i1 %74, i32 255, i32 0
  %76 = select i1 %73, i32 %75, i32 %64
  %77 = select i1 %72, i32 %55, i32 %76
  %78 = zext i8 %60 to i32
  %79 = trunc i32 %77 to i8
  store i8 %79, i8 addrspace(1)* %59, align 1, !tbaa !7
  %80 = add nuw nsw i32 %32, 2
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %81
  %83 = load i8, i8 addrspace(1)* %82, align 1, !tbaa !7
  %84 = sext i32 %57 to i64
  %85 = tail call i8 @llvm.smin.i8(i8 %83, i8 %79)
  %86 = sext i8 %85 to i32
  %87 = add nsw i32 %86, 1
  %88 = load i8, i8 addrspace(1)* %23, align 1, !tbaa !7
  %89 = sext i8 %88 to i32
  %90 = icmp slt i32 %87, %89
  %91 = zext i1 %90 to i32
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %84
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !7
  %94 = sext i8 %93 to i32
  %95 = icmp eq i32 %91, %94
  %96 = icmp eq i8 %60, -1
  %97 = icmp eq i8 %88, %93
  %98 = select i1 %97, i32 255, i32 0
  %99 = select i1 %96, i32 %98, i32 %87
  %100 = select i1 %95, i32 %78, i32 %99
  %101 = zext i8 %83 to i32
  %102 = trunc i32 %100 to i8
  store i8 %102, i8 addrspace(1)* %82, align 1, !tbaa !7
  %103 = add nuw i32 %32, 3
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %104
  %106 = load i8, i8 addrspace(1)* %105, align 1, !tbaa !7
  %107 = sext i32 %80 to i64
  %108 = tail call i8 @llvm.smin.i8(i8 %106, i8 %102)
  %109 = sext i8 %108 to i32
  %110 = add nsw i32 %109, 1
  %111 = load i8, i8 addrspace(1)* %23, align 1, !tbaa !7
  %112 = sext i8 %111 to i32
  %113 = icmp slt i32 %110, %112
  %114 = zext i1 %113 to i32
  %115 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %107
  %116 = load i8, i8 addrspace(1)* %115, align 1, !tbaa !7
  %117 = sext i8 %116 to i32
  %118 = icmp eq i32 %114, %117
  %119 = icmp eq i8 %83, -1
  %120 = icmp eq i8 %111, %116
  %121 = select i1 %120, i32 255, i32 0
  %122 = select i1 %119, i32 %121, i32 %110
  %123 = select i1 %118, i32 %101, i32 %122
  %124 = sext i8 %106 to i32
  %125 = trunc i32 %123 to i8
  store i8 %125, i8 addrspace(1)* %105, align 1, !tbaa !7
  %126 = add nuw i32 %32, 4
  %127 = add i32 %33, 4
  %128 = icmp eq i32 %127, %28
  br i1 %128, label %129, label %29, !llvm.loop !10

129:                                              ; preds = %29
  %130 = sext i8 %106 to i32
  br label %131

131:                                              ; preds = %129, %21
  %132 = phi i8 [ %24, %21 ], [ %125, %129 ]
  %133 = phi i32 [ %19, %21 ], [ %130, %129 ]
  %134 = phi i32 [ 1, %21 ], [ %126, %129 ]
  %135 = icmp eq i32 %25, 0
  br i1 %135, label %167, label %136

136:                                              ; preds = %131, %136
  %137 = phi i8 [ %163, %136 ], [ %132, %131 ]
  %138 = phi i32 [ %162, %136 ], [ %133, %131 ]
  %139 = phi i32 [ %164, %136 ], [ %134, %131 ]
  %140 = phi i32 [ %165, %136 ], [ 0, %131 ]
  %141 = zext i32 %139 to i64
  %142 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %141
  %143 = load i8, i8 addrspace(1)* %142, align 1, !tbaa !7
  %144 = add nsw i32 %139, -1
  %145 = sext i32 %144 to i64
  %146 = tail call i8 @llvm.smin.i8(i8 %143, i8 %137)
  %147 = sext i8 %146 to i32
  %148 = add nsw i32 %147, 1
  %149 = load i8, i8 addrspace(1)* %23, align 1, !tbaa !7
  %150 = sext i8 %149 to i32
  %151 = icmp slt i32 %148, %150
  %152 = zext i1 %151 to i32
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %145
  %154 = load i8, i8 addrspace(1)* %153, align 1, !tbaa !7
  %155 = sext i8 %154 to i32
  %156 = icmp eq i32 %152, %155
  %157 = icmp eq i32 %138, -1
  %158 = icmp eq i8 %149, %154
  %159 = select i1 %158, i32 255, i32 0
  %160 = select i1 %157, i32 %159, i32 %148
  %161 = select i1 %156, i32 %138, i32 %160
  %162 = sext i8 %143 to i32
  %163 = trunc i32 %161 to i8
  store i8 %163, i8 addrspace(1)* %142, align 1, !tbaa !7
  %164 = add nuw i32 %139, 1
  %165 = add i32 %140, 1
  %166 = icmp eq i32 %165, %25
  br i1 %166, label %167, label %136, !llvm.loop !12

167:                                              ; preds = %131, %136, %17, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.smin.i8(i8, i8) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
