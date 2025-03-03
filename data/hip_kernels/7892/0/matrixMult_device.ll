; ModuleID = '../data/hip_kernels/7892/0/main.cu'
source_filename = "../data/hip_kernels/7892/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @matrixMult(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %163

25:                                               ; preds = %4
  %26 = icmp sgt i32 %3, 0
  %27 = mul nsw i32 %21, %3
  br i1 %26, label %28, label %56

28:                                               ; preds = %25
  %29 = and i32 %3, 7
  %30 = icmp ult i32 %3, 8
  br i1 %30, label %33, label %31

31:                                               ; preds = %28
  %32 = and i32 %3, -8
  br label %61

33:                                               ; preds = %61, %28
  %34 = phi double [ undef, %28 ], [ %159, %61 ]
  %35 = phi i32 [ 0, %28 ], [ %160, %61 ]
  %36 = phi double [ 0.000000e+00, %28 ], [ %159, %61 ]
  %37 = icmp eq i32 %29, 0
  br i1 %37, label %56, label %38

38:                                               ; preds = %33, %38
  %39 = phi i32 [ %53, %38 ], [ %35, %33 ]
  %40 = phi double [ %52, %38 ], [ %36, %33 ]
  %41 = phi i32 [ %54, %38 ], [ 0, %33 ]
  %42 = mul nsw i32 %39, %3
  %43 = add nsw i32 %42, %13
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !5
  %47 = add nsw i32 %39, %27
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7, !amdgpu.noclobber !5
  %51 = fmul contract double %46, %50
  %52 = fadd contract double %40, %51
  %53 = add nuw nsw i32 %39, 1
  %54 = add i32 %41, 1
  %55 = icmp eq i32 %54, %29
  br i1 %55, label %56, label %38, !llvm.loop !11

56:                                               ; preds = %33, %38, %25
  %57 = phi double [ 0.000000e+00, %25 ], [ %34, %33 ], [ %52, %38 ]
  %58 = add nsw i32 %27, %13
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %2, i64 %59
  store double %57, double addrspace(1)* %60, align 8, !tbaa !7
  br label %163

61:                                               ; preds = %61, %31
  %62 = phi i32 [ 0, %31 ], [ %160, %61 ]
  %63 = phi double [ 0.000000e+00, %31 ], [ %159, %61 ]
  %64 = phi i32 [ 0, %31 ], [ %161, %61 ]
  %65 = mul nsw i32 %62, %3
  %66 = add nsw i32 %65, %13
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7, !amdgpu.noclobber !5
  %70 = add nsw i32 %62, %27
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double addrspace(1)* %1, i64 %71
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !7, !amdgpu.noclobber !5
  %74 = fmul contract double %69, %73
  %75 = fadd contract double %63, %74
  %76 = or i32 %62, 1
  %77 = mul nsw i32 %76, %3
  %78 = add nsw i32 %77, %13
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %0, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7, !amdgpu.noclobber !5
  %82 = add nsw i32 %76, %27
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %1, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !7, !amdgpu.noclobber !5
  %86 = fmul contract double %81, %85
  %87 = fadd contract double %75, %86
  %88 = or i32 %62, 2
  %89 = mul nsw i32 %88, %3
  %90 = add nsw i32 %89, %13
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %0, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !7, !amdgpu.noclobber !5
  %94 = add nsw i32 %88, %27
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %1, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7, !amdgpu.noclobber !5
  %98 = fmul contract double %93, %97
  %99 = fadd contract double %87, %98
  %100 = or i32 %62, 3
  %101 = mul nsw i32 %100, %3
  %102 = add nsw i32 %101, %13
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, double addrspace(1)* %0, i64 %103
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7, !amdgpu.noclobber !5
  %106 = add nsw i32 %100, %27
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %1, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !7, !amdgpu.noclobber !5
  %110 = fmul contract double %105, %109
  %111 = fadd contract double %99, %110
  %112 = or i32 %62, 4
  %113 = mul nsw i32 %112, %3
  %114 = add nsw i32 %113, %13
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double addrspace(1)* %0, i64 %115
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !7, !amdgpu.noclobber !5
  %118 = add nsw i32 %112, %27
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds double, double addrspace(1)* %1, i64 %119
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !7, !amdgpu.noclobber !5
  %122 = fmul contract double %117, %121
  %123 = fadd contract double %111, %122
  %124 = or i32 %62, 5
  %125 = mul nsw i32 %124, %3
  %126 = add nsw i32 %125, %13
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds double, double addrspace(1)* %0, i64 %127
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !7, !amdgpu.noclobber !5
  %130 = add nsw i32 %124, %27
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds double, double addrspace(1)* %1, i64 %131
  %133 = load double, double addrspace(1)* %132, align 8, !tbaa !7, !amdgpu.noclobber !5
  %134 = fmul contract double %129, %133
  %135 = fadd contract double %123, %134
  %136 = or i32 %62, 6
  %137 = mul nsw i32 %136, %3
  %138 = add nsw i32 %137, %13
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds double, double addrspace(1)* %0, i64 %139
  %141 = load double, double addrspace(1)* %140, align 8, !tbaa !7, !amdgpu.noclobber !5
  %142 = add nsw i32 %136, %27
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds double, double addrspace(1)* %1, i64 %143
  %145 = load double, double addrspace(1)* %144, align 8, !tbaa !7, !amdgpu.noclobber !5
  %146 = fmul contract double %141, %145
  %147 = fadd contract double %135, %146
  %148 = or i32 %62, 7
  %149 = mul nsw i32 %148, %3
  %150 = add nsw i32 %149, %13
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double, double addrspace(1)* %0, i64 %151
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !7, !amdgpu.noclobber !5
  %154 = add nsw i32 %148, %27
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds double, double addrspace(1)* %1, i64 %155
  %157 = load double, double addrspace(1)* %156, align 8, !tbaa !7, !amdgpu.noclobber !5
  %158 = fmul contract double %153, %157
  %159 = fadd contract double %147, %158
  %160 = add nuw nsw i32 %62, 8
  %161 = add i32 %64, 8
  %162 = icmp eq i32 %161, %32
  br i1 %162, label %33, label %61, !llvm.loop !13

163:                                              ; preds = %56, %4
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
