; ModuleID = '../data/hip_kernels/2922/37/main.cu'
source_filename = "../data/hip_kernels/2922/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4initPdS_S_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %3
  br i1 %15, label %16, label %135

16:                                               ; preds = %5
  %17 = icmp sgt i32 %4, 0
  br i1 %17, label %18, label %45

18:                                               ; preds = %16
  %19 = mul nsw i32 %14, %4
  %20 = and i32 %4, 7
  %21 = icmp ult i32 %4, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %18
  %23 = and i32 %4, -8
  br label %49

24:                                               ; preds = %49, %18
  %25 = phi double [ undef, %18 ], [ %131, %49 ]
  %26 = phi i32 [ 0, %18 ], [ %132, %49 ]
  %27 = phi double [ 0.000000e+00, %18 ], [ %131, %49 ]
  %28 = icmp eq i32 %20, 0
  br i1 %28, label %45, label %29

29:                                               ; preds = %24, %29
  %30 = phi i32 [ %42, %29 ], [ %26, %24 ]
  %31 = phi double [ %41, %29 ], [ %27, %24 ]
  %32 = phi i32 [ %43, %29 ], [ 0, %24 ]
  %33 = add nsw i32 %30, %19
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = zext i32 %30 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !5
  %40 = fmul contract double %36, %39
  %41 = fadd contract double %31, %40
  %42 = add nuw nsw i32 %30, 1
  %43 = add i32 %32, 1
  %44 = icmp eq i32 %43, %20
  br i1 %44, label %45, label %29, !llvm.loop !11

45:                                               ; preds = %24, %29, %16
  %46 = phi double [ 0.000000e+00, %16 ], [ %25, %24 ], [ %41, %29 ]
  %47 = sext i32 %14 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %2, i64 %47
  store double %46, double addrspace(1)* %48, align 8, !tbaa !7
  br label %135

49:                                               ; preds = %49, %22
  %50 = phi i32 [ 0, %22 ], [ %132, %49 ]
  %51 = phi double [ 0.000000e+00, %22 ], [ %131, %49 ]
  %52 = phi i32 [ 0, %22 ], [ %133, %49 ]
  %53 = add nsw i32 %50, %19
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %0, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7, !amdgpu.noclobber !5
  %57 = zext i32 %50 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %1, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7, !amdgpu.noclobber !5
  %60 = fmul contract double %56, %59
  %61 = fadd contract double %51, %60
  %62 = or i32 %50, 1
  %63 = add nsw i32 %62, %19
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %0, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7, !amdgpu.noclobber !5
  %67 = zext i32 %62 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %1, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7, !amdgpu.noclobber !5
  %70 = fmul contract double %66, %69
  %71 = fadd contract double %61, %70
  %72 = or i32 %50, 2
  %73 = add nsw i32 %72, %19
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7, !amdgpu.noclobber !5
  %77 = zext i32 %72 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %1, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !7, !amdgpu.noclobber !5
  %80 = fmul contract double %76, %79
  %81 = fadd contract double %71, %80
  %82 = or i32 %50, 3
  %83 = add nsw i32 %82, %19
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7, !amdgpu.noclobber !5
  %87 = zext i32 %82 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %1, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !7, !amdgpu.noclobber !5
  %90 = fmul contract double %86, %89
  %91 = fadd contract double %81, %90
  %92 = or i32 %50, 4
  %93 = add nsw i32 %92, %19
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds double, double addrspace(1)* %0, i64 %94
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !7, !amdgpu.noclobber !5
  %97 = zext i32 %92 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %1, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7, !amdgpu.noclobber !5
  %100 = fmul contract double %96, %99
  %101 = fadd contract double %91, %100
  %102 = or i32 %50, 5
  %103 = add nsw i32 %102, %19
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %0, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !7, !amdgpu.noclobber !5
  %107 = zext i32 %102 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %1, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !7, !amdgpu.noclobber !5
  %110 = fmul contract double %106, %109
  %111 = fadd contract double %101, %110
  %112 = or i32 %50, 6
  %113 = add nsw i32 %112, %19
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %0, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !7, !amdgpu.noclobber !5
  %117 = zext i32 %112 to i64
  %118 = getelementptr inbounds double, double addrspace(1)* %1, i64 %117
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !7, !amdgpu.noclobber !5
  %120 = fmul contract double %116, %119
  %121 = fadd contract double %111, %120
  %122 = or i32 %50, 7
  %123 = add nsw i32 %122, %19
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %0, i64 %124
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !7, !amdgpu.noclobber !5
  %127 = zext i32 %122 to i64
  %128 = getelementptr inbounds double, double addrspace(1)* %1, i64 %127
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !7, !amdgpu.noclobber !5
  %130 = fmul contract double %126, %129
  %131 = fadd contract double %121, %130
  %132 = add nuw nsw i32 %50, 8
  %133 = add i32 %52, 8
  %134 = icmp eq i32 %133, %23
  br i1 %134, label %24, label %49, !llvm.loop !13

135:                                              ; preds = %5, %45
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
