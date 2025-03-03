; ModuleID = '../data/hip_kernels/3939/2/main.cu'
source_filename = "../data/hip_kernels/3939/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12dense_kerneliiPdS_S_S_i(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %1
  br i1 %17, label %18, label %144

18:                                               ; preds = %7
  %19 = icmp sgt i32 %0, 0
  br i1 %19, label %20, label %47

20:                                               ; preds = %18
  %21 = mul nsw i32 %16, %0
  %22 = and i32 %0, 7
  %23 = icmp ult i32 %0, 8
  br i1 %23, label %26, label %24

24:                                               ; preds = %20
  %25 = and i32 %0, -8
  br label %58

26:                                               ; preds = %58, %20
  %27 = phi double [ undef, %20 ], [ %140, %58 ]
  %28 = phi i32 [ 0, %20 ], [ %141, %58 ]
  %29 = phi double [ 0.000000e+00, %20 ], [ %140, %58 ]
  %30 = icmp eq i32 %22, 0
  br i1 %30, label %47, label %31

31:                                               ; preds = %26, %31
  %32 = phi i32 [ %44, %31 ], [ %28, %26 ]
  %33 = phi double [ %43, %31 ], [ %29, %26 ]
  %34 = phi i32 [ %45, %31 ], [ 0, %26 ]
  %35 = zext i32 %32 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %2, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !7, !amdgpu.noclobber !5
  %38 = add nsw i32 %32, %21
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %3, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract double %37, %41
  %43 = fadd contract double %33, %42
  %44 = add nuw nsw i32 %32, 1
  %45 = add i32 %34, 1
  %46 = icmp eq i32 %45, %22
  br i1 %46, label %47, label %31, !llvm.loop !11

47:                                               ; preds = %26, %31, %18
  %48 = phi double [ 0.000000e+00, %18 ], [ %27, %26 ], [ %43, %31 ]
  %49 = sext i32 %16 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %4, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7, !amdgpu.noclobber !5
  %52 = fadd contract double %48, %51
  %53 = icmp ne i32 %1, %6
  %54 = fcmp contract olt double %52, 0.000000e+00
  %55 = select i1 %53, i1 %54, i1 false
  %56 = select i1 %55, double 0.000000e+00, double %52
  %57 = getelementptr inbounds double, double addrspace(1)* %5, i64 %49
  store double %56, double addrspace(1)* %57, align 8, !tbaa !7
  br label %144

58:                                               ; preds = %58, %24
  %59 = phi i32 [ 0, %24 ], [ %141, %58 ]
  %60 = phi double [ 0.000000e+00, %24 ], [ %140, %58 ]
  %61 = phi i32 [ 0, %24 ], [ %142, %58 ]
  %62 = zext i32 %59 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %2, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !5
  %65 = add nsw i32 %59, %21
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %3, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7, !amdgpu.noclobber !5
  %69 = fmul contract double %64, %68
  %70 = fadd contract double %60, %69
  %71 = or i32 %59, 1
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %2, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7, !amdgpu.noclobber !5
  %75 = add nsw i32 %71, %21
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %3, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !7, !amdgpu.noclobber !5
  %79 = fmul contract double %74, %78
  %80 = fadd contract double %70, %79
  %81 = or i32 %59, 2
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %2, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7, !amdgpu.noclobber !5
  %85 = add nsw i32 %81, %21
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %3, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7, !amdgpu.noclobber !5
  %89 = fmul contract double %84, %88
  %90 = fadd contract double %80, %89
  %91 = or i32 %59, 3
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %2, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !7, !amdgpu.noclobber !5
  %95 = add nsw i32 %91, %21
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double, double addrspace(1)* %3, i64 %96
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !7, !amdgpu.noclobber !5
  %99 = fmul contract double %94, %98
  %100 = fadd contract double %90, %99
  %101 = or i32 %59, 4
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %2, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !7, !amdgpu.noclobber !5
  %105 = add nsw i32 %101, %21
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %3, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !7, !amdgpu.noclobber !5
  %109 = fmul contract double %104, %108
  %110 = fadd contract double %100, %109
  %111 = or i32 %59, 5
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %2, i64 %112
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !7, !amdgpu.noclobber !5
  %115 = add nsw i32 %111, %21
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %3, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !7, !amdgpu.noclobber !5
  %119 = fmul contract double %114, %118
  %120 = fadd contract double %110, %119
  %121 = or i32 %59, 6
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds double, double addrspace(1)* %2, i64 %122
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !7, !amdgpu.noclobber !5
  %125 = add nsw i32 %121, %21
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds double, double addrspace(1)* %3, i64 %126
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !7, !amdgpu.noclobber !5
  %129 = fmul contract double %124, %128
  %130 = fadd contract double %120, %129
  %131 = or i32 %59, 7
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds double, double addrspace(1)* %2, i64 %132
  %134 = load double, double addrspace(1)* %133, align 8, !tbaa !7, !amdgpu.noclobber !5
  %135 = add nsw i32 %131, %21
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds double, double addrspace(1)* %3, i64 %136
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !7, !amdgpu.noclobber !5
  %139 = fmul contract double %134, %138
  %140 = fadd contract double %130, %139
  %141 = add nuw nsw i32 %59, 8
  %142 = add i32 %61, 8
  %143 = icmp eq i32 %142, %25
  br i1 %143, label %26, label %58, !llvm.loop !13

144:                                              ; preds = %7, %47
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
