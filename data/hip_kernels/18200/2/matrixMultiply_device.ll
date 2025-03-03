; ModuleID = '../data/hip_kernels/18200/2/main.cu'
source_filename = "../data/hip_kernels/18200/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14matrixMultiplyPdS_S_iiii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = zext i32 %16 to i64
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = zext i32 %25 to i64
  %27 = sext i32 %4 to i64
  %28 = icmp slt i64 %17, %27
  %29 = sext i32 %3 to i64
  %30 = icmp slt i64 %26, %29
  %31 = select i1 %28, i1 %30, i1 false
  br i1 %31, label %32, label %171

32:                                               ; preds = %7
  %33 = icmp sgt i32 %5, 0
  br i1 %33, label %34, label %64

34:                                               ; preds = %32
  %35 = zext i32 %5 to i64
  %36 = mul nuw nsw i64 %26, %35
  %37 = and i32 %5, 7
  %38 = icmp ult i32 %5, 8
  br i1 %38, label %41, label %39

39:                                               ; preds = %34
  %40 = and i32 %5, -8
  br label %69

41:                                               ; preds = %69, %34
  %42 = phi double [ undef, %34 ], [ %167, %69 ]
  %43 = phi i32 [ 0, %34 ], [ %168, %69 ]
  %44 = phi double [ 0.000000e+00, %34 ], [ %167, %69 ]
  %45 = icmp eq i32 %37, 0
  br i1 %45, label %64, label %46

46:                                               ; preds = %41, %46
  %47 = phi i32 [ %61, %46 ], [ %43, %41 ]
  %48 = phi double [ %60, %46 ], [ %44, %41 ]
  %49 = phi i32 [ %62, %46 ], [ 0, %41 ]
  %50 = zext i32 %47 to i64
  %51 = add nuw nsw i64 %36, %50
  %52 = getelementptr inbounds double, double addrspace(1)* %0, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7, !amdgpu.noclobber !5
  %54 = mul nsw i32 %47, %6
  %55 = sext i32 %54 to i64
  %56 = add nsw i64 %55, %17
  %57 = getelementptr inbounds double, double addrspace(1)* %1, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !5
  %59 = fmul contract double %53, %58
  %60 = fadd contract double %48, %59
  %61 = add nuw nsw i32 %47, 1
  %62 = add i32 %49, 1
  %63 = icmp eq i32 %62, %37
  br i1 %63, label %64, label %46, !llvm.loop !11

64:                                               ; preds = %41, %46, %32
  %65 = phi double [ 0.000000e+00, %32 ], [ %42, %41 ], [ %60, %46 ]
  %66 = mul nsw i64 %26, %27
  %67 = add nsw i64 %66, %17
  %68 = getelementptr inbounds double, double addrspace(1)* %2, i64 %67
  store double %65, double addrspace(1)* %68, align 8, !tbaa !7
  br label %171

69:                                               ; preds = %69, %39
  %70 = phi i32 [ 0, %39 ], [ %168, %69 ]
  %71 = phi double [ 0.000000e+00, %39 ], [ %167, %69 ]
  %72 = phi i32 [ 0, %39 ], [ %169, %69 ]
  %73 = zext i32 %70 to i64
  %74 = add nuw nsw i64 %36, %73
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7, !amdgpu.noclobber !5
  %77 = mul nsw i32 %70, %6
  %78 = sext i32 %77 to i64
  %79 = add nsw i64 %78, %17
  %80 = getelementptr inbounds double, double addrspace(1)* %1, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7, !amdgpu.noclobber !5
  %82 = fmul contract double %76, %81
  %83 = fadd contract double %71, %82
  %84 = or i32 %70, 1
  %85 = zext i32 %84 to i64
  %86 = add nuw nsw i64 %36, %85
  %87 = getelementptr inbounds double, double addrspace(1)* %0, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7, !amdgpu.noclobber !5
  %89 = mul nsw i32 %84, %6
  %90 = sext i32 %89 to i64
  %91 = add nsw i64 %90, %17
  %92 = getelementptr inbounds double, double addrspace(1)* %1, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !7, !amdgpu.noclobber !5
  %94 = fmul contract double %88, %93
  %95 = fadd contract double %83, %94
  %96 = or i32 %70, 2
  %97 = zext i32 %96 to i64
  %98 = add nuw nsw i64 %36, %97
  %99 = getelementptr inbounds double, double addrspace(1)* %0, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !7, !amdgpu.noclobber !5
  %101 = mul nsw i32 %96, %6
  %102 = sext i32 %101 to i64
  %103 = add nsw i64 %102, %17
  %104 = getelementptr inbounds double, double addrspace(1)* %1, i64 %103
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7, !amdgpu.noclobber !5
  %106 = fmul contract double %100, %105
  %107 = fadd contract double %95, %106
  %108 = or i32 %70, 3
  %109 = zext i32 %108 to i64
  %110 = add nuw nsw i64 %36, %109
  %111 = getelementptr inbounds double, double addrspace(1)* %0, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !7, !amdgpu.noclobber !5
  %113 = mul nsw i32 %108, %6
  %114 = sext i32 %113 to i64
  %115 = add nsw i64 %114, %17
  %116 = getelementptr inbounds double, double addrspace(1)* %1, i64 %115
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !7, !amdgpu.noclobber !5
  %118 = fmul contract double %112, %117
  %119 = fadd contract double %107, %118
  %120 = or i32 %70, 4
  %121 = zext i32 %120 to i64
  %122 = add nuw nsw i64 %36, %121
  %123 = getelementptr inbounds double, double addrspace(1)* %0, i64 %122
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !7, !amdgpu.noclobber !5
  %125 = mul nsw i32 %120, %6
  %126 = sext i32 %125 to i64
  %127 = add nsw i64 %126, %17
  %128 = getelementptr inbounds double, double addrspace(1)* %1, i64 %127
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !7, !amdgpu.noclobber !5
  %130 = fmul contract double %124, %129
  %131 = fadd contract double %119, %130
  %132 = or i32 %70, 5
  %133 = zext i32 %132 to i64
  %134 = add nuw nsw i64 %36, %133
  %135 = getelementptr inbounds double, double addrspace(1)* %0, i64 %134
  %136 = load double, double addrspace(1)* %135, align 8, !tbaa !7, !amdgpu.noclobber !5
  %137 = mul nsw i32 %132, %6
  %138 = sext i32 %137 to i64
  %139 = add nsw i64 %138, %17
  %140 = getelementptr inbounds double, double addrspace(1)* %1, i64 %139
  %141 = load double, double addrspace(1)* %140, align 8, !tbaa !7, !amdgpu.noclobber !5
  %142 = fmul contract double %136, %141
  %143 = fadd contract double %131, %142
  %144 = or i32 %70, 6
  %145 = zext i32 %144 to i64
  %146 = add nuw nsw i64 %36, %145
  %147 = getelementptr inbounds double, double addrspace(1)* %0, i64 %146
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !7, !amdgpu.noclobber !5
  %149 = mul nsw i32 %144, %6
  %150 = sext i32 %149 to i64
  %151 = add nsw i64 %150, %17
  %152 = getelementptr inbounds double, double addrspace(1)* %1, i64 %151
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !7, !amdgpu.noclobber !5
  %154 = fmul contract double %148, %153
  %155 = fadd contract double %143, %154
  %156 = or i32 %70, 7
  %157 = zext i32 %156 to i64
  %158 = add nuw nsw i64 %36, %157
  %159 = getelementptr inbounds double, double addrspace(1)* %0, i64 %158
  %160 = load double, double addrspace(1)* %159, align 8, !tbaa !7, !amdgpu.noclobber !5
  %161 = mul nsw i32 %156, %6
  %162 = sext i32 %161 to i64
  %163 = add nsw i64 %162, %17
  %164 = getelementptr inbounds double, double addrspace(1)* %1, i64 %163
  %165 = load double, double addrspace(1)* %164, align 8, !tbaa !7, !amdgpu.noclobber !5
  %166 = fmul contract double %160, %165
  %167 = fadd contract double %155, %166
  %168 = add nuw nsw i32 %70, 8
  %169 = add i32 %72, 8
  %170 = icmp eq i32 %169, %40
  br i1 %170, label %41, label %69, !llvm.loop !13

171:                                              ; preds = %64, %7
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
