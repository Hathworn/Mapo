; ModuleID = '../data/hip_kernels/3136/33/main.cu'
source_filename = "../data/hip_kernels/3136/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24cudaclaw5_update_q_cuda2iiiiddPdS_S_S_S_(i32 %0, i32 %1, i32 %2, i32 %3, double %4, double %5, double addrspace(1)* nocapture %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %27, %21
  %29 = icmp slt i32 %20, %1
  %30 = icmp slt i32 %28, %2
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %175

32:                                               ; preds = %11
  %33 = shl nsw i32 %0, 1
  %34 = add nsw i32 %33, %1
  %35 = mul nsw i32 %34, %3
  %36 = add nsw i32 %20, %0
  %37 = mul nsw i32 %36, %3
  %38 = add nsw i32 %28, %0
  %39 = mul nsw i32 %38, %35
  %40 = add nsw i32 %39, %37
  %41 = icmp sgt i32 %3, 0
  br i1 %41, label %42, label %175

42:                                               ; preds = %32
  %43 = and i32 %3, 3
  %44 = icmp ult i32 %3, 4
  br i1 %44, label %144, label %45

45:                                               ; preds = %42
  %46 = and i32 %3, -4
  br label %47

47:                                               ; preds = %47, %45
  %48 = phi i32 [ 0, %45 ], [ %141, %47 ]
  %49 = phi i32 [ 0, %45 ], [ %142, %47 ]
  %50 = add nsw i32 %40, %48
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %6, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7
  %54 = add nsw i32 %50, %3
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %7, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7
  %58 = getelementptr inbounds double, double addrspace(1)* %8, i64 %51
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = fsub contract double %57, %59
  %61 = fmul contract double %60, %4
  %62 = fsub contract double %53, %61
  %63 = add nsw i32 %50, %35
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %9, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7
  %67 = getelementptr inbounds double, double addrspace(1)* %10, i64 %51
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7
  %69 = fsub contract double %66, %68
  %70 = fmul contract double %69, %5
  %71 = fsub contract double %62, %70
  store double %71, double addrspace(1)* %52, align 8, !tbaa !7
  %72 = or i32 %48, 1
  %73 = add nsw i32 %40, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %6, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7
  %77 = add nsw i32 %73, %3
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %7, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !7
  %81 = getelementptr inbounds double, double addrspace(1)* %8, i64 %74
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !7
  %83 = fsub contract double %80, %82
  %84 = fmul contract double %83, %4
  %85 = fsub contract double %76, %84
  %86 = add nsw i32 %73, %35
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %9, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !7
  %90 = getelementptr inbounds double, double addrspace(1)* %10, i64 %74
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !7
  %92 = fsub contract double %89, %91
  %93 = fmul contract double %92, %5
  %94 = fsub contract double %85, %93
  store double %94, double addrspace(1)* %75, align 8, !tbaa !7
  %95 = or i32 %48, 2
  %96 = add nsw i32 %40, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %6, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7
  %100 = add nsw i32 %96, %3
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds double, double addrspace(1)* %7, i64 %101
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !7
  %104 = getelementptr inbounds double, double addrspace(1)* %8, i64 %97
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7
  %106 = fsub contract double %103, %105
  %107 = fmul contract double %106, %4
  %108 = fsub contract double %99, %107
  %109 = add nsw i32 %96, %35
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds double, double addrspace(1)* %9, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !7
  %113 = getelementptr inbounds double, double addrspace(1)* %10, i64 %97
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !7
  %115 = fsub contract double %112, %114
  %116 = fmul contract double %115, %5
  %117 = fsub contract double %108, %116
  store double %117, double addrspace(1)* %98, align 8, !tbaa !7
  %118 = or i32 %48, 3
  %119 = add nsw i32 %40, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds double, double addrspace(1)* %6, i64 %120
  %122 = load double, double addrspace(1)* %121, align 8, !tbaa !7
  %123 = add nsw i32 %119, %3
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %7, i64 %124
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !7
  %127 = getelementptr inbounds double, double addrspace(1)* %8, i64 %120
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !7
  %129 = fsub contract double %126, %128
  %130 = fmul contract double %129, %4
  %131 = fsub contract double %122, %130
  %132 = add nsw i32 %119, %35
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds double, double addrspace(1)* %9, i64 %133
  %135 = load double, double addrspace(1)* %134, align 8, !tbaa !7
  %136 = getelementptr inbounds double, double addrspace(1)* %10, i64 %120
  %137 = load double, double addrspace(1)* %136, align 8, !tbaa !7
  %138 = fsub contract double %135, %137
  %139 = fmul contract double %138, %5
  %140 = fsub contract double %131, %139
  store double %140, double addrspace(1)* %121, align 8, !tbaa !7
  %141 = add nuw nsw i32 %48, 4
  %142 = add i32 %49, 4
  %143 = icmp eq i32 %142, %46
  br i1 %143, label %144, label %47, !llvm.loop !11

144:                                              ; preds = %47, %42
  %145 = phi i32 [ 0, %42 ], [ %141, %47 ]
  %146 = icmp eq i32 %43, 0
  br i1 %146, label %175, label %147

147:                                              ; preds = %144, %147
  %148 = phi i32 [ %172, %147 ], [ %145, %144 ]
  %149 = phi i32 [ %173, %147 ], [ 0, %144 ]
  %150 = add nsw i32 %40, %148
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double, double addrspace(1)* %6, i64 %151
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !7
  %154 = add nsw i32 %150, %3
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds double, double addrspace(1)* %7, i64 %155
  %157 = load double, double addrspace(1)* %156, align 8, !tbaa !7
  %158 = getelementptr inbounds double, double addrspace(1)* %8, i64 %151
  %159 = load double, double addrspace(1)* %158, align 8, !tbaa !7
  %160 = fsub contract double %157, %159
  %161 = fmul contract double %160, %4
  %162 = fsub contract double %153, %161
  %163 = add nsw i32 %150, %35
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds double, double addrspace(1)* %9, i64 %164
  %166 = load double, double addrspace(1)* %165, align 8, !tbaa !7
  %167 = getelementptr inbounds double, double addrspace(1)* %10, i64 %151
  %168 = load double, double addrspace(1)* %167, align 8, !tbaa !7
  %169 = fsub contract double %166, %168
  %170 = fmul contract double %169, %5
  %171 = fsub contract double %162, %170
  store double %171, double addrspace(1)* %152, align 8, !tbaa !7
  %172 = add nuw nsw i32 %148, 1
  %173 = add i32 %149, 1
  %174 = icmp eq i32 %173, %43
  br i1 %174, label %175, label %147, !llvm.loop !13

175:                                              ; preds = %144, %147, %32, %11
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
