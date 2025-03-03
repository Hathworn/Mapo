; ModuleID = '../data/hip_kernels/17070/5/main.cu'
source_filename = "../data/hip_kernels/17070/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10matrixMultPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp sgt i32 %3, 0
  %23 = mul nsw i32 %13, %3
  br i1 %22, label %24, label %51

24:                                               ; preds = %4
  %25 = mul nsw i32 %21, %3
  %26 = and i32 %3, 7
  %27 = icmp ult i32 %3, 8
  br i1 %27, label %30, label %28

28:                                               ; preds = %24
  %29 = and i32 %3, -8
  br label %56

30:                                               ; preds = %56, %24
  %31 = phi i32 [ 0, %24 ], [ %147, %56 ]
  %32 = phi i32 [ undef, %24 ], [ %146, %56 ]
  %33 = icmp eq i32 %26, 0
  br i1 %33, label %51, label %34

34:                                               ; preds = %30, %34
  %35 = phi i32 [ %48, %34 ], [ %31, %30 ]
  %36 = phi i32 [ %47, %34 ], [ %32, %30 ]
  %37 = phi i32 [ %49, %34 ], [ 0, %30 ]
  %38 = add nsw i32 %35, %23
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = add nsw i32 %35, %25
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = mul nsw i32 %45, %41
  %47 = add nsw i32 %46, %36
  %48 = add nuw nsw i32 %35, 1
  %49 = add i32 %37, 1
  %50 = icmp eq i32 %49, %26
  br i1 %50, label %51, label %34, !llvm.loop !11

51:                                               ; preds = %30, %34, %4
  %52 = phi i32 [ undef, %4 ], [ %32, %30 ], [ %47, %34 ]
  %53 = add nsw i32 %23, %21
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  store i32 %52, i32 addrspace(1)* %55, align 4, !tbaa !7
  ret void

56:                                               ; preds = %56, %28
  %57 = phi i32 [ 0, %28 ], [ %147, %56 ]
  %58 = phi i32 [ undef, %28 ], [ %146, %56 ]
  %59 = phi i32 [ 0, %28 ], [ %148, %56 ]
  %60 = add nsw i32 %57, %23
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = add nsw i32 %57, %25
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = mul nsw i32 %67, %63
  %69 = add nsw i32 %68, %58
  %70 = or i32 %57, 1
  %71 = add nsw i32 %70, %23
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = add nsw i32 %70, %25
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = mul nsw i32 %78, %74
  %80 = add nsw i32 %79, %69
  %81 = or i32 %57, 2
  %82 = add nsw i32 %81, %23
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = add nsw i32 %81, %25
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = mul nsw i32 %89, %85
  %91 = add nsw i32 %90, %80
  %92 = or i32 %57, 3
  %93 = add nsw i32 %92, %23
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = add nsw i32 %92, %25
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = mul nsw i32 %100, %96
  %102 = add nsw i32 %101, %91
  %103 = or i32 %57, 4
  %104 = add nsw i32 %103, %23
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = add nsw i32 %103, %25
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = mul nsw i32 %111, %107
  %113 = add nsw i32 %112, %102
  %114 = or i32 %57, 5
  %115 = add nsw i32 %114, %23
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = add nsw i32 %114, %25
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = mul nsw i32 %122, %118
  %124 = add nsw i32 %123, %113
  %125 = or i32 %57, 6
  %126 = add nsw i32 %125, %23
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %127
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = add nsw i32 %125, %25
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %131
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = mul nsw i32 %133, %129
  %135 = add nsw i32 %134, %124
  %136 = or i32 %57, 7
  %137 = add nsw i32 %136, %23
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %138
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = add nsw i32 %136, %25
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %142
  %144 = load i32, i32 addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = mul nsw i32 %144, %140
  %146 = add nsw i32 %145, %135
  %147 = add nuw nsw i32 %57, 8
  %148 = add i32 %59, 8
  %149 = icmp eq i32 %148, %29
  br i1 %149, label %30, label %56, !llvm.loop !13
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
