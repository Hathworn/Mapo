; ModuleID = '../data/hip_kernels/8390/6/main.cu'
source_filename = "../data/hip_kernels/8390/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14multiplicationPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %3
  %25 = icmp slt i32 %23, %5
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %165

27:                                               ; preds = %6
  %28 = icmp sgt i32 %4, 0
  %29 = mul nsw i32 %15, %3
  br i1 %28, label %30, label %58

30:                                               ; preds = %27
  %31 = and i32 %4, 7
  %32 = icmp ult i32 %4, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %30
  %34 = and i32 %4, -8
  br label %63

35:                                               ; preds = %63, %30
  %36 = phi i32 [ undef, %30 ], [ %161, %63 ]
  %37 = phi i32 [ 0, %30 ], [ %162, %63 ]
  %38 = phi i32 [ 0, %30 ], [ %161, %63 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %58, label %40

40:                                               ; preds = %35, %40
  %41 = phi i32 [ %55, %40 ], [ %37, %35 ]
  %42 = phi i32 [ %54, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %56, %40 ], [ 0, %35 ]
  %44 = add nsw i32 %41, %29
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = mul nsw i32 %41, %4
  %49 = add nsw i32 %48, %23
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = mul nsw i32 %52, %47
  %54 = add nsw i32 %53, %42
  %55 = add nuw nsw i32 %41, 1
  %56 = add i32 %43, 1
  %57 = icmp eq i32 %56, %31
  br i1 %57, label %58, label %40, !llvm.loop !11

58:                                               ; preds = %35, %40, %27
  %59 = phi i32 [ 0, %27 ], [ %36, %35 ], [ %54, %40 ]
  %60 = add nsw i32 %29, %23
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %61
  store i32 %59, i32 addrspace(1)* %62, align 4, !tbaa !7
  br label %165

63:                                               ; preds = %63, %33
  %64 = phi i32 [ 0, %33 ], [ %162, %63 ]
  %65 = phi i32 [ 0, %33 ], [ %161, %63 ]
  %66 = phi i32 [ 0, %33 ], [ %163, %63 ]
  %67 = add nsw i32 %64, %29
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = mul nsw i32 %64, %4
  %72 = add nsw i32 %71, %23
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = mul nsw i32 %75, %70
  %77 = add nsw i32 %76, %65
  %78 = or i32 %64, 1
  %79 = add nsw i32 %78, %29
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = mul nsw i32 %78, %4
  %84 = add nsw i32 %83, %23
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = mul nsw i32 %87, %82
  %89 = add nsw i32 %88, %77
  %90 = or i32 %64, 2
  %91 = add nsw i32 %90, %29
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = mul nsw i32 %90, %4
  %96 = add nsw i32 %95, %23
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = mul nsw i32 %99, %94
  %101 = add nsw i32 %100, %89
  %102 = or i32 %64, 3
  %103 = add nsw i32 %102, %29
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = mul nsw i32 %102, %4
  %108 = add nsw i32 %107, %23
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = mul nsw i32 %111, %106
  %113 = add nsw i32 %112, %101
  %114 = or i32 %64, 4
  %115 = add nsw i32 %114, %29
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = mul nsw i32 %114, %4
  %120 = add nsw i32 %119, %23
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = mul nsw i32 %123, %118
  %125 = add nsw i32 %124, %113
  %126 = or i32 %64, 5
  %127 = add nsw i32 %126, %29
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = mul nsw i32 %126, %4
  %132 = add nsw i32 %131, %23
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !5
  %136 = mul nsw i32 %135, %130
  %137 = add nsw i32 %136, %125
  %138 = or i32 %64, 6
  %139 = add nsw i32 %138, %29
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  %143 = mul nsw i32 %138, %4
  %144 = add nsw i32 %143, %23
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %145
  %147 = load i32, i32 addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !5
  %148 = mul nsw i32 %147, %142
  %149 = add nsw i32 %148, %137
  %150 = or i32 %64, 7
  %151 = add nsw i32 %150, %29
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %152
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !7, !amdgpu.noclobber !5
  %155 = mul nsw i32 %150, %4
  %156 = add nsw i32 %155, %23
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %157
  %159 = load i32, i32 addrspace(1)* %158, align 4, !tbaa !7, !amdgpu.noclobber !5
  %160 = mul nsw i32 %159, %154
  %161 = add nsw i32 %160, %149
  %162 = add nuw nsw i32 %64, 8
  %163 = add i32 %66, 8
  %164 = icmp eq i32 %163, %34
  br i1 %164, label %35, label %63, !llvm.loop !13

165:                                              ; preds = %58, %6
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
