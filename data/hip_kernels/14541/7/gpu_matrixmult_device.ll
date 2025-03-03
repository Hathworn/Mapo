; ModuleID = '../data/hip_kernels/14541/7/main.cu'
source_filename = "../data/hip_kernels/14541/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14gpu_matrixmultPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %163

25:                                               ; preds = %4
  %26 = icmp sgt i32 %3, 0
  %27 = mul nsw i32 %21, %3
  br i1 %26, label %28, label %158

28:                                               ; preds = %25
  %29 = and i32 %3, 7
  %30 = icmp ult i32 %3, 8
  br i1 %30, label %135, label %31

31:                                               ; preds = %28
  %32 = and i32 %3, -8
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi i32 [ 0, %31 ], [ %132, %33 ]
  %35 = phi i32 [ 0, %31 ], [ %131, %33 ]
  %36 = phi i32 [ 0, %31 ], [ %133, %33 ]
  %37 = add nsw i32 %34, %27
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = mul nsw i32 %34, %3
  %42 = add nsw i32 %41, %13
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = mul nsw i32 %45, %40
  %47 = add nsw i32 %46, %35
  %48 = or i32 %34, 1
  %49 = add nsw i32 %48, %27
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !6
  %53 = mul nsw i32 %48, %3
  %54 = add nsw i32 %53, %13
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !6
  %58 = mul nsw i32 %57, %52
  %59 = add nsw i32 %58, %47
  %60 = or i32 %34, 2
  %61 = add nsw i32 %60, %27
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = mul nsw i32 %60, %3
  %66 = add nsw i32 %65, %13
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = mul nsw i32 %69, %64
  %71 = add nsw i32 %70, %59
  %72 = or i32 %34, 3
  %73 = add nsw i32 %72, %27
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = mul nsw i32 %72, %3
  %78 = add nsw i32 %77, %13
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = mul nsw i32 %81, %76
  %83 = add nsw i32 %82, %71
  %84 = or i32 %34, 4
  %85 = add nsw i32 %84, %27
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !6
  %89 = mul nsw i32 %84, %3
  %90 = add nsw i32 %89, %13
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = mul nsw i32 %93, %88
  %95 = add nsw i32 %94, %83
  %96 = or i32 %34, 5
  %97 = add nsw i32 %96, %27
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !6
  %101 = mul nsw i32 %96, %3
  %102 = add nsw i32 %101, %13
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = mul nsw i32 %105, %100
  %107 = add nsw i32 %106, %95
  %108 = or i32 %34, 6
  %109 = add nsw i32 %108, %27
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !6
  %113 = mul nsw i32 %108, %3
  %114 = add nsw i32 %113, %13
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !6
  %118 = mul nsw i32 %117, %112
  %119 = add nsw i32 %118, %107
  %120 = or i32 %34, 7
  %121 = add nsw i32 %120, %27
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !6
  %125 = mul nsw i32 %120, %3
  %126 = add nsw i32 %125, %13
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %127
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !6
  %130 = mul nsw i32 %129, %124
  %131 = add nsw i32 %130, %119
  %132 = add nuw nsw i32 %34, 8
  %133 = add i32 %36, 8
  %134 = icmp eq i32 %133, %32
  br i1 %134, label %135, label %33, !llvm.loop !11

135:                                              ; preds = %33, %28
  %136 = phi i32 [ undef, %28 ], [ %131, %33 ]
  %137 = phi i32 [ 0, %28 ], [ %132, %33 ]
  %138 = phi i32 [ 0, %28 ], [ %131, %33 ]
  %139 = icmp eq i32 %29, 0
  br i1 %139, label %158, label %140

140:                                              ; preds = %135, %140
  %141 = phi i32 [ %155, %140 ], [ %137, %135 ]
  %142 = phi i32 [ %154, %140 ], [ %138, %135 ]
  %143 = phi i32 [ %156, %140 ], [ 0, %135 ]
  %144 = add nsw i32 %141, %27
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %145
  %147 = load i32, i32 addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !6
  %148 = mul nsw i32 %141, %3
  %149 = add nsw i32 %148, %13
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %150
  %152 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !6
  %153 = mul nsw i32 %152, %147
  %154 = add nsw i32 %153, %142
  %155 = add nuw nsw i32 %141, 1
  %156 = add i32 %143, 1
  %157 = icmp eq i32 %156, %29
  br i1 %157, label %158, label %140, !llvm.loop !13

158:                                              ; preds = %135, %140, %25
  %159 = phi i32 [ 0, %25 ], [ %136, %135 ], [ %154, %140 ]
  %160 = add nsw i32 %27, %13
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %161
  store i32 %159, i32 addrspace(1)* %162, align 4, !tbaa !7
  br label %163

163:                                              ; preds = %158, %4
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
