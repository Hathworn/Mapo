; ModuleID = '../data/hip_kernels/435/2/main.cu'
source_filename = "../data/hip_kernels/435/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9r1_updatePdiiiS_iS_(double addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, double addrspace(1)* nocapture readonly %4, i32 %5, double addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %1
  %26 = icmp slt i32 %24, %1
  %27 = select i1 %25, i1 %26, i1 false
  %28 = icmp sgt i32 %2, 1
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %153

30:                                               ; preds = %7
  %31 = mul nsw i32 %16, %3
  %32 = mul nsw i32 %24, %5
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %4, i64 %33
  %35 = add i32 %2, -2
  %36 = add i32 %2, -1
  %37 = and i32 %36, 7
  %38 = icmp ult i32 %35, 7
  br i1 %38, label %134, label %39

39:                                               ; preds = %30
  %40 = and i32 %36, -8
  br label %41

41:                                               ; preds = %41, %39
  %42 = phi i32 [ 0, %39 ], [ %121, %41 ]
  %43 = phi i32 [ 0, %39 ], [ %132, %41 ]
  %44 = or i32 %42, 1
  %45 = add i32 %44, %31
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7
  %49 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %50 = zext i32 %44 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %6, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %53 = fmul contract double %49, %52
  %54 = fsub contract double %48, %53
  store double %54, double addrspace(1)* %47, align 8, !tbaa !7
  %55 = or i32 %42, 2
  %56 = add i32 %55, %31
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %61 = zext i32 %55 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %6, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7
  %64 = fmul contract double %60, %63
  %65 = fsub contract double %59, %64
  store double %65, double addrspace(1)* %58, align 8, !tbaa !7
  %66 = or i32 %42, 3
  %67 = add i32 %66, %31
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %0, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7
  %71 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %72 = zext i32 %66 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %6, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7
  %75 = fmul contract double %71, %74
  %76 = fsub contract double %70, %75
  store double %76, double addrspace(1)* %69, align 8, !tbaa !7
  %77 = or i32 %42, 4
  %78 = add i32 %77, %31
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %0, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7
  %82 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %6, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !7
  %86 = fmul contract double %82, %85
  %87 = fsub contract double %81, %86
  store double %87, double addrspace(1)* %80, align 8, !tbaa !7
  %88 = or i32 %42, 5
  %89 = add i32 %88, %31
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %0, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !7
  %93 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %94 = zext i32 %88 to i64
  %95 = getelementptr inbounds double, double addrspace(1)* %6, i64 %94
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !7
  %97 = fmul contract double %93, %96
  %98 = fsub contract double %92, %97
  store double %98, double addrspace(1)* %91, align 8, !tbaa !7
  %99 = or i32 %42, 6
  %100 = add i32 %99, %31
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds double, double addrspace(1)* %0, i64 %101
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !7
  %104 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %105 = zext i32 %99 to i64
  %106 = getelementptr inbounds double, double addrspace(1)* %6, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !7
  %108 = fmul contract double %104, %107
  %109 = fsub contract double %103, %108
  store double %109, double addrspace(1)* %102, align 8, !tbaa !7
  %110 = or i32 %42, 7
  %111 = add i32 %110, %31
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %0, i64 %112
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !7
  %115 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %116 = zext i32 %110 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %6, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !7
  %119 = fmul contract double %115, %118
  %120 = fsub contract double %114, %119
  store double %120, double addrspace(1)* %113, align 8, !tbaa !7
  %121 = add nuw nsw i32 %42, 8
  %122 = add i32 %121, %31
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %0, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !7
  %126 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %127 = zext i32 %121 to i64
  %128 = getelementptr inbounds double, double addrspace(1)* %6, i64 %127
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !7
  %130 = fmul contract double %126, %129
  %131 = fsub contract double %125, %130
  store double %131, double addrspace(1)* %124, align 8, !tbaa !7
  %132 = add i32 %43, 8
  %133 = icmp eq i32 %132, %40
  br i1 %133, label %134, label %41, !llvm.loop !11

134:                                              ; preds = %41, %30
  %135 = phi i32 [ 0, %30 ], [ %121, %41 ]
  %136 = icmp eq i32 %37, 0
  br i1 %136, label %153, label %137

137:                                              ; preds = %134, %137
  %138 = phi i32 [ %140, %137 ], [ %135, %134 ]
  %139 = phi i32 [ %151, %137 ], [ 0, %134 ]
  %140 = add nuw nsw i32 %138, 1
  %141 = add i32 %140, %31
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds double, double addrspace(1)* %0, i64 %142
  %144 = load double, double addrspace(1)* %143, align 8, !tbaa !7
  %145 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %146 = zext i32 %140 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %6, i64 %146
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !7
  %149 = fmul contract double %145, %148
  %150 = fsub contract double %144, %149
  store double %150, double addrspace(1)* %143, align 8, !tbaa !7
  %151 = add i32 %139, 1
  %152 = icmp eq i32 %151, %37
  br i1 %152, label %153, label %137, !llvm.loop !13

153:                                              ; preds = %134, %137, %7
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
