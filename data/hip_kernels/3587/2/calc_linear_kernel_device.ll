; ModuleID = '../data/hip_kernels/3587/2/main.cu'
source_filename = "../data/hip_kernels/3587/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL18calc_linear_kerneliiPdS_ = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL18calc_linear_kerneliiPdS_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 comdat {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = freeze i32 %13
  %15 = freeze i32 %0
  %16 = sdiv i32 %14, %15
  %17 = mul i32 %16, %15
  %18 = sub i32 %14, %17
  %19 = icmp slt i32 %16, %0
  br i1 %19, label %20, label %158

20:                                               ; preds = %4
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %22, label %50

22:                                               ; preds = %20
  %23 = and i32 %1, 7
  %24 = icmp ult i32 %1, 8
  br i1 %24, label %27, label %25

25:                                               ; preds = %22
  %26 = and i32 %1, -8
  br label %56

27:                                               ; preds = %56, %22
  %28 = phi double [ undef, %22 ], [ %154, %56 ]
  %29 = phi i32 [ 0, %22 ], [ %155, %56 ]
  %30 = phi double [ 0.000000e+00, %22 ], [ %154, %56 ]
  %31 = icmp eq i32 %23, 0
  br i1 %31, label %50, label %32

32:                                               ; preds = %27, %32
  %33 = phi i32 [ %47, %32 ], [ %29, %27 ]
  %34 = phi double [ %46, %32 ], [ %30, %27 ]
  %35 = phi i32 [ %48, %32 ], [ 0, %27 ]
  %36 = mul nsw i32 %33, %0
  %37 = add nsw i32 %36, %16
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %2, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7, !amdgpu.noclobber !5
  %41 = add nsw i32 %36, %18
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %2, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7, !amdgpu.noclobber !5
  %45 = fmul contract double %40, %44
  %46 = fadd contract double %34, %45
  %47 = add nuw nsw i32 %33, 1
  %48 = add i32 %35, 1
  %49 = icmp eq i32 %48, %23
  br i1 %49, label %50, label %32, !llvm.loop !11

50:                                               ; preds = %27, %32, %20
  %51 = phi double [ 0.000000e+00, %20 ], [ %28, %27 ], [ %46, %32 ]
  %52 = mul nsw i32 %16, %0
  %53 = add nsw i32 %52, %18
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %3, i64 %54
  store double %51, double addrspace(1)* %55, align 8, !tbaa !7
  br label %158

56:                                               ; preds = %56, %25
  %57 = phi i32 [ 0, %25 ], [ %155, %56 ]
  %58 = phi double [ 0.000000e+00, %25 ], [ %154, %56 ]
  %59 = phi i32 [ 0, %25 ], [ %156, %56 ]
  %60 = mul nsw i32 %57, %0
  %61 = add nsw i32 %60, %16
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %2, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !5
  %65 = add nsw i32 %60, %18
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %2, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7, !amdgpu.noclobber !5
  %69 = fmul contract double %64, %68
  %70 = fadd contract double %58, %69
  %71 = or i32 %57, 1
  %72 = mul nsw i32 %71, %0
  %73 = add nsw i32 %72, %16
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %2, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7, !amdgpu.noclobber !5
  %77 = add nsw i32 %72, %18
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %2, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !7, !amdgpu.noclobber !5
  %81 = fmul contract double %76, %80
  %82 = fadd contract double %70, %81
  %83 = or i32 %57, 2
  %84 = mul nsw i32 %83, %0
  %85 = add nsw i32 %84, %16
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %2, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7, !amdgpu.noclobber !5
  %89 = add nsw i32 %84, %18
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %2, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !7, !amdgpu.noclobber !5
  %93 = fmul contract double %88, %92
  %94 = fadd contract double %82, %93
  %95 = or i32 %57, 3
  %96 = mul nsw i32 %95, %0
  %97 = add nsw i32 %96, %16
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %2, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !7, !amdgpu.noclobber !5
  %101 = add nsw i32 %96, %18
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %2, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !7, !amdgpu.noclobber !5
  %105 = fmul contract double %100, %104
  %106 = fadd contract double %94, %105
  %107 = or i32 %57, 4
  %108 = mul nsw i32 %107, %0
  %109 = add nsw i32 %108, %16
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds double, double addrspace(1)* %2, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !7, !amdgpu.noclobber !5
  %113 = add nsw i32 %108, %18
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %2, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !7, !amdgpu.noclobber !5
  %117 = fmul contract double %112, %116
  %118 = fadd contract double %106, %117
  %119 = or i32 %57, 5
  %120 = mul nsw i32 %119, %0
  %121 = add nsw i32 %120, %16
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds double, double addrspace(1)* %2, i64 %122
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !7, !amdgpu.noclobber !5
  %125 = add nsw i32 %120, %18
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds double, double addrspace(1)* %2, i64 %126
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !7, !amdgpu.noclobber !5
  %129 = fmul contract double %124, %128
  %130 = fadd contract double %118, %129
  %131 = or i32 %57, 6
  %132 = mul nsw i32 %131, %0
  %133 = add nsw i32 %132, %16
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds double, double addrspace(1)* %2, i64 %134
  %136 = load double, double addrspace(1)* %135, align 8, !tbaa !7, !amdgpu.noclobber !5
  %137 = add nsw i32 %132, %18
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds double, double addrspace(1)* %2, i64 %138
  %140 = load double, double addrspace(1)* %139, align 8, !tbaa !7, !amdgpu.noclobber !5
  %141 = fmul contract double %136, %140
  %142 = fadd contract double %130, %141
  %143 = or i32 %57, 7
  %144 = mul nsw i32 %143, %0
  %145 = add nsw i32 %144, %16
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %2, i64 %146
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !7, !amdgpu.noclobber !5
  %149 = add nsw i32 %144, %18
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds double, double addrspace(1)* %2, i64 %150
  %152 = load double, double addrspace(1)* %151, align 8, !tbaa !7, !amdgpu.noclobber !5
  %153 = fmul contract double %148, %152
  %154 = fadd contract double %142, %153
  %155 = add nuw nsw i32 %57, 8
  %156 = add i32 %59, 8
  %157 = icmp eq i32 %156, %26
  br i1 %157, label %27, label %56, !llvm.loop !13

158:                                              ; preds = %50, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
