; ModuleID = '../data/hip_kernels/9004/1/main.cu'
source_filename = "../data/hip_kernels/9004/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8cuda_mulPdS_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
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
  %22 = mul nsw i32 %21, %3
  %23 = icmp sgt i32 %3, 0
  br i1 %23, label %24, label %52

24:                                               ; preds = %4
  %25 = and i32 %3, 7
  %26 = icmp ult i32 %3, 8
  br i1 %26, label %29, label %27

27:                                               ; preds = %24
  %28 = and i32 %3, -8
  br label %57

29:                                               ; preds = %57, %24
  %30 = phi double [ undef, %24 ], [ %155, %57 ]
  %31 = phi i32 [ 0, %24 ], [ %156, %57 ]
  %32 = phi double [ 0.000000e+00, %24 ], [ %155, %57 ]
  %33 = icmp eq i32 %25, 0
  br i1 %33, label %52, label %34

34:                                               ; preds = %29, %34
  %35 = phi i32 [ %49, %34 ], [ %31, %29 ]
  %36 = phi double [ %48, %34 ], [ %32, %29 ]
  %37 = phi i32 [ %50, %34 ], [ 0, %29 ]
  %38 = add nsw i32 %35, %22
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !5
  %42 = mul nsw i32 %35, %3
  %43 = add nsw i32 %42, %13
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %1, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !5
  %47 = fadd contract double %41, %46
  %48 = fadd contract double %36, %47
  %49 = add nuw nsw i32 %35, 1
  %50 = add i32 %37, 1
  %51 = icmp eq i32 %50, %25
  br i1 %51, label %52, label %34, !llvm.loop !11

52:                                               ; preds = %29, %34, %4
  %53 = phi double [ 0.000000e+00, %4 ], [ %30, %29 ], [ %48, %34 ]
  %54 = add nsw i32 %22, %13
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %2, i64 %55
  store double %53, double addrspace(1)* %56, align 8, !tbaa !7
  ret void

57:                                               ; preds = %57, %27
  %58 = phi i32 [ 0, %27 ], [ %156, %57 ]
  %59 = phi double [ 0.000000e+00, %27 ], [ %155, %57 ]
  %60 = phi i32 [ 0, %27 ], [ %157, %57 ]
  %61 = add nsw i32 %58, %22
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !5
  %65 = mul nsw i32 %58, %3
  %66 = add nsw i32 %65, %13
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %1, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7, !amdgpu.noclobber !5
  %70 = fadd contract double %64, %69
  %71 = fadd contract double %59, %70
  %72 = or i32 %58, 1
  %73 = add nsw i32 %72, %22
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7, !amdgpu.noclobber !5
  %77 = mul nsw i32 %72, %3
  %78 = add nsw i32 %77, %13
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %1, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7, !amdgpu.noclobber !5
  %82 = fadd contract double %76, %81
  %83 = fadd contract double %71, %82
  %84 = or i32 %58, 2
  %85 = add nsw i32 %84, %22
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %0, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7, !amdgpu.noclobber !5
  %89 = mul nsw i32 %84, %3
  %90 = add nsw i32 %89, %13
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %1, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !7, !amdgpu.noclobber !5
  %94 = fadd contract double %88, %93
  %95 = fadd contract double %83, %94
  %96 = or i32 %58, 3
  %97 = add nsw i32 %96, %22
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %0, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !7, !amdgpu.noclobber !5
  %101 = mul nsw i32 %96, %3
  %102 = add nsw i32 %101, %13
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, double addrspace(1)* %1, i64 %103
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7, !amdgpu.noclobber !5
  %106 = fadd contract double %100, %105
  %107 = fadd contract double %95, %106
  %108 = or i32 %58, 4
  %109 = add nsw i32 %108, %22
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds double, double addrspace(1)* %0, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !7, !amdgpu.noclobber !5
  %113 = mul nsw i32 %108, %3
  %114 = add nsw i32 %113, %13
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double addrspace(1)* %1, i64 %115
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !7, !amdgpu.noclobber !5
  %118 = fadd contract double %112, %117
  %119 = fadd contract double %107, %118
  %120 = or i32 %58, 5
  %121 = add nsw i32 %120, %22
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds double, double addrspace(1)* %0, i64 %122
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !7, !amdgpu.noclobber !5
  %125 = mul nsw i32 %120, %3
  %126 = add nsw i32 %125, %13
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds double, double addrspace(1)* %1, i64 %127
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !7, !amdgpu.noclobber !5
  %130 = fadd contract double %124, %129
  %131 = fadd contract double %119, %130
  %132 = or i32 %58, 6
  %133 = add nsw i32 %132, %22
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds double, double addrspace(1)* %0, i64 %134
  %136 = load double, double addrspace(1)* %135, align 8, !tbaa !7, !amdgpu.noclobber !5
  %137 = mul nsw i32 %132, %3
  %138 = add nsw i32 %137, %13
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds double, double addrspace(1)* %1, i64 %139
  %141 = load double, double addrspace(1)* %140, align 8, !tbaa !7, !amdgpu.noclobber !5
  %142 = fadd contract double %136, %141
  %143 = fadd contract double %131, %142
  %144 = or i32 %58, 7
  %145 = add nsw i32 %144, %22
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %0, i64 %146
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !7, !amdgpu.noclobber !5
  %149 = mul nsw i32 %144, %3
  %150 = add nsw i32 %149, %13
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double, double addrspace(1)* %1, i64 %151
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !7, !amdgpu.noclobber !5
  %154 = fadd contract double %148, %153
  %155 = fadd contract double %143, %154
  %156 = add nuw nsw i32 %58, 8
  %157 = add i32 %60, 8
  %158 = icmp eq i32 %157, %28
  br i1 %158, label %29, label %57, !llvm.loop !13
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
