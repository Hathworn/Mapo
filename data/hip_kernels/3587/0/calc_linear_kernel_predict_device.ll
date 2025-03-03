; ModuleID = '../data/hip_kernels/3587/0/main.cu'
source_filename = "../data/hip_kernels/3587/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL26calc_linear_kernel_predictiiPdiS_S_ = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL26calc_linear_kernel_predictiiPdiS_S_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 comdat {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = freeze i32 %15
  %17 = freeze i32 %0
  %18 = sdiv i32 %16, %17
  %19 = mul i32 %18, %17
  %20 = sub i32 %16, %19
  %21 = icmp slt i32 %18, %3
  br i1 %21, label %22, label %151

22:                                               ; preds = %6
  %23 = icmp sgt i32 %1, 0
  br i1 %23, label %24, label %53

24:                                               ; preds = %22
  %25 = mul nsw i32 %18, %1
  %26 = mul nsw i32 %20, %1
  %27 = and i32 %1, 7
  %28 = icmp ult i32 %1, 8
  br i1 %28, label %31, label %29

29:                                               ; preds = %24
  %30 = and i32 %1, -8
  br label %57

31:                                               ; preds = %57, %24
  %32 = phi double [ undef, %24 ], [ %147, %57 ]
  %33 = phi i32 [ 0, %24 ], [ %148, %57 ]
  %34 = phi double [ 1.000000e+00, %24 ], [ %147, %57 ]
  %35 = icmp eq i32 %27, 0
  br i1 %35, label %53, label %36

36:                                               ; preds = %31, %36
  %37 = phi i32 [ %50, %36 ], [ %33, %31 ]
  %38 = phi double [ %49, %36 ], [ %34, %31 ]
  %39 = phi i32 [ %51, %36 ], [ 0, %31 ]
  %40 = add nsw i32 %37, %25
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %4, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7, !amdgpu.noclobber !5
  %44 = add nsw i32 %37, %26
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %2, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !5
  %48 = fmul contract double %43, %47
  %49 = fadd contract double %38, %48
  %50 = add nuw nsw i32 %37, 1
  %51 = add i32 %39, 1
  %52 = icmp eq i32 %51, %27
  br i1 %52, label %53, label %36, !llvm.loop !11

53:                                               ; preds = %31, %36, %22
  %54 = phi double [ 1.000000e+00, %22 ], [ %32, %31 ], [ %49, %36 ]
  %55 = sext i32 %15 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %5, i64 %55
  store double %54, double addrspace(1)* %56, align 8, !tbaa !7
  br label %151

57:                                               ; preds = %57, %29
  %58 = phi i32 [ 0, %29 ], [ %148, %57 ]
  %59 = phi double [ 1.000000e+00, %29 ], [ %147, %57 ]
  %60 = phi i32 [ 0, %29 ], [ %149, %57 ]
  %61 = add nsw i32 %58, %25
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %4, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !5
  %65 = add nsw i32 %58, %26
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %2, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7, !amdgpu.noclobber !5
  %69 = fmul contract double %64, %68
  %70 = fadd contract double %59, %69
  %71 = or i32 %58, 1
  %72 = add nsw i32 %71, %25
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %4, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7, !amdgpu.noclobber !5
  %76 = add nsw i32 %71, %26
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %2, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !7, !amdgpu.noclobber !5
  %80 = fmul contract double %75, %79
  %81 = fadd contract double %70, %80
  %82 = or i32 %58, 2
  %83 = add nsw i32 %82, %25
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %4, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7, !amdgpu.noclobber !5
  %87 = add nsw i32 %82, %26
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %2, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !7, !amdgpu.noclobber !5
  %91 = fmul contract double %86, %90
  %92 = fadd contract double %81, %91
  %93 = or i32 %58, 3
  %94 = add nsw i32 %93, %25
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %4, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7, !amdgpu.noclobber !5
  %98 = add nsw i32 %93, %26
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %2, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !7, !amdgpu.noclobber !5
  %102 = fmul contract double %97, %101
  %103 = fadd contract double %92, %102
  %104 = or i32 %58, 4
  %105 = add nsw i32 %104, %25
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %4, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !7, !amdgpu.noclobber !5
  %109 = add nsw i32 %104, %26
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds double, double addrspace(1)* %2, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !7, !amdgpu.noclobber !5
  %113 = fmul contract double %108, %112
  %114 = fadd contract double %103, %113
  %115 = or i32 %58, 5
  %116 = add nsw i32 %115, %25
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds double, double addrspace(1)* %4, i64 %117
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !7, !amdgpu.noclobber !5
  %120 = add nsw i32 %115, %26
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %2, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !7, !amdgpu.noclobber !5
  %124 = fmul contract double %119, %123
  %125 = fadd contract double %114, %124
  %126 = or i32 %58, 6
  %127 = add nsw i32 %126, %25
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds double, double addrspace(1)* %4, i64 %128
  %130 = load double, double addrspace(1)* %129, align 8, !tbaa !7, !amdgpu.noclobber !5
  %131 = add nsw i32 %126, %26
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds double, double addrspace(1)* %2, i64 %132
  %134 = load double, double addrspace(1)* %133, align 8, !tbaa !7, !amdgpu.noclobber !5
  %135 = fmul contract double %130, %134
  %136 = fadd contract double %125, %135
  %137 = or i32 %58, 7
  %138 = add nsw i32 %137, %25
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds double, double addrspace(1)* %4, i64 %139
  %141 = load double, double addrspace(1)* %140, align 8, !tbaa !7, !amdgpu.noclobber !5
  %142 = add nsw i32 %137, %26
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds double, double addrspace(1)* %2, i64 %143
  %145 = load double, double addrspace(1)* %144, align 8, !tbaa !7, !amdgpu.noclobber !5
  %146 = fmul contract double %141, %145
  %147 = fadd contract double %136, %146
  %148 = add nuw nsw i32 %58, 8
  %149 = add i32 %60, 8
  %150 = icmp eq i32 %149, %30
  br i1 %150, label %31, label %57, !llvm.loop !13

151:                                              ; preds = %53, %6
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
