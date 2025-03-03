; ModuleID = '../data/hip_kernels/18438/8/main.cu'
source_filename = "../data/hip_kernels/18438/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13argmin_3d_matPfPiii(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = mul i32 %3, %2
  %15 = mul i32 %14, 51
  %16 = icmp slt i32 %13, %3
  br i1 %16, label %17, label %156

17:                                               ; preds = %4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %2
  %27 = icmp sgt i32 %15, 0
  %28 = tail call i32 @llvm.smax.i32(i32 %15, i32 %14)
  %29 = add i32 %28, -1
  br label %30

30:                                               ; preds = %17, %153
  %31 = phi i32 [ %13, %17 ], [ %154, %153 ]
  br i1 %26, label %32, label %153

32:                                               ; preds = %30, %67
  %33 = phi i32 [ %71, %67 ], [ %25, %30 ]
  %34 = mul nsw i32 %33, %3
  %35 = add nsw i32 %34, %31
  br i1 %27, label %36, label %67

36:                                               ; preds = %32
  %37 = udiv i32 %29, %14
  %38 = add i32 %37, 1
  %39 = and i32 %38, 7
  %40 = icmp ult i32 %37, 7
  br i1 %40, label %43, label %41

41:                                               ; preds = %36
  %42 = and i32 %38, -8
  br label %73

43:                                               ; preds = %73, %36
  %44 = phi i32 [ undef, %36 ], [ %147, %73 ]
  %45 = phi i32 [ 0, %36 ], [ %150, %73 ]
  %46 = phi i32 [ 0, %36 ], [ %149, %73 ]
  %47 = phi float [ 1.000000e+08, %36 ], [ %148, %73 ]
  %48 = phi i32 [ -1, %36 ], [ %147, %73 ]
  %49 = icmp eq i32 %39, 0
  br i1 %49, label %67, label %50

50:                                               ; preds = %43, %50
  %51 = phi i32 [ %64, %50 ], [ %45, %43 ]
  %52 = phi i32 [ %63, %50 ], [ %46, %43 ]
  %53 = phi float [ %62, %50 ], [ %47, %43 ]
  %54 = phi i32 [ %61, %50 ], [ %48, %43 ]
  %55 = phi i32 [ %65, %50 ], [ 0, %43 ]
  %56 = add nsw i32 %51, %35
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fcmp contract olt float %59, %53
  %61 = select i1 %60, i32 %52, i32 %54
  %62 = select i1 %60, float %59, float %53
  %63 = add nuw i32 %52, 1
  %64 = add nsw i32 %51, %14
  %65 = add i32 %55, 1
  %66 = icmp eq i32 %65, %39
  br i1 %66, label %67, label %50, !llvm.loop !11

67:                                               ; preds = %43, %50, %32
  %68 = phi i32 [ -1, %32 ], [ %44, %43 ], [ %61, %50 ]
  %69 = sext i32 %35 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  store i32 %68, i32 addrspace(1)* %70, align 4, !tbaa !13
  %71 = add i32 %33, %22
  %72 = icmp slt i32 %71, %2
  br i1 %72, label %32, label %153, !llvm.loop !15

73:                                               ; preds = %73, %41
  %74 = phi i32 [ 0, %41 ], [ %150, %73 ]
  %75 = phi i32 [ 0, %41 ], [ %149, %73 ]
  %76 = phi float [ 1.000000e+08, %41 ], [ %148, %73 ]
  %77 = phi i32 [ -1, %41 ], [ %147, %73 ]
  %78 = phi i32 [ 0, %41 ], [ %151, %73 ]
  %79 = add nsw i32 %74, %35
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fcmp contract olt float %82, %76
  %84 = select i1 %83, i32 %75, i32 %77
  %85 = select i1 %83, float %82, float %76
  %86 = or i32 %75, 1
  %87 = add nsw i32 %74, %14
  %88 = add nsw i32 %87, %35
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = fcmp contract olt float %91, %85
  %93 = select i1 %92, i32 %86, i32 %84
  %94 = select i1 %92, float %91, float %85
  %95 = or i32 %75, 2
  %96 = add nsw i32 %87, %14
  %97 = add nsw i32 %96, %35
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = fcmp contract olt float %100, %94
  %102 = select i1 %101, i32 %95, i32 %93
  %103 = select i1 %101, float %100, float %94
  %104 = or i32 %75, 3
  %105 = add nsw i32 %96, %14
  %106 = add nsw i32 %105, %35
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = fcmp contract olt float %109, %103
  %111 = select i1 %110, i32 %104, i32 %102
  %112 = select i1 %110, float %109, float %103
  %113 = or i32 %75, 4
  %114 = add nsw i32 %105, %14
  %115 = add nsw i32 %114, %35
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = fcmp contract olt float %118, %112
  %120 = select i1 %119, i32 %113, i32 %111
  %121 = select i1 %119, float %118, float %112
  %122 = or i32 %75, 5
  %123 = add nsw i32 %114, %14
  %124 = add nsw i32 %123, %35
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = fcmp contract olt float %127, %121
  %129 = select i1 %128, i32 %122, i32 %120
  %130 = select i1 %128, float %127, float %121
  %131 = or i32 %75, 6
  %132 = add nsw i32 %123, %14
  %133 = add nsw i32 %132, %35
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = fcmp contract olt float %136, %130
  %138 = select i1 %137, i32 %131, i32 %129
  %139 = select i1 %137, float %136, float %130
  %140 = or i32 %75, 7
  %141 = add nsw i32 %132, %14
  %142 = add nsw i32 %141, %35
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = fcmp contract olt float %145, %139
  %147 = select i1 %146, i32 %140, i32 %138
  %148 = select i1 %146, float %145, float %139
  %149 = add nuw i32 %75, 8
  %150 = add nsw i32 %141, %14
  %151 = add i32 %78, 8
  %152 = icmp eq i32 %151, %42
  br i1 %152, label %43, label %73, !llvm.loop !17

153:                                              ; preds = %67, %30
  %154 = add i32 %31, %10
  %155 = icmp slt i32 %154, %3
  br i1 %155, label %30, label %156, !llvm.loop !18

156:                                              ; preds = %153, %4
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !9, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !16}
