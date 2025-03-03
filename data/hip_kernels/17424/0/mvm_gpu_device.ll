; ModuleID = '../data/hip_kernels/17424/0/main.cu'
source_filename = "../data/hip_kernels/17424/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7mvm_gpuPdS_S_PiS0_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %6
  br i1 %17, label %18, label %146

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %19
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = add nsw i32 %23, %21
  %25 = icmp sgt i32 %23, 0
  br i1 %25, label %26, label %146

26:                                               ; preds = %18
  %27 = icmp sgt i32 %5, 0
  %28 = and i32 %5, 7
  %29 = icmp ult i32 %5, 8
  %30 = and i32 %5, -8
  %31 = icmp eq i32 %28, 0
  br label %32

32:                                               ; preds = %26, %57
  %33 = phi i32 [ %21, %26 ], [ %58, %57 ]
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  store double 0.000000e+00, double addrspace(1)* %35, align 8, !tbaa !11
  br i1 %27, label %36, label %57

36:                                               ; preds = %32
  %37 = mul nsw i32 %33, %5
  br i1 %29, label %38, label %60

38:                                               ; preds = %60, %36
  %39 = phi double [ 0.000000e+00, %36 ], [ %142, %60 ]
  %40 = phi i32 [ 0, %36 ], [ %143, %60 ]
  br i1 %31, label %57, label %41

41:                                               ; preds = %38, %41
  %42 = phi double [ %53, %41 ], [ %39, %38 ]
  %43 = phi i32 [ %54, %41 ], [ %40, %38 ]
  %44 = phi i32 [ %55, %41 ], [ 0, %38 ]
  %45 = add nsw i32 %43, %37
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !11
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %1, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !11
  %52 = fmul contract double %48, %51
  %53 = fadd contract double %42, %52
  store double %53, double addrspace(1)* %35, align 8, !tbaa !11
  %54 = add nuw nsw i32 %43, 1
  %55 = add i32 %44, 1
  %56 = icmp eq i32 %55, %28
  br i1 %56, label %57, label %41, !llvm.loop !13

57:                                               ; preds = %38, %41, %32
  %58 = add nsw i32 %33, 1
  %59 = icmp slt i32 %58, %24
  br i1 %59, label %32, label %146, !llvm.loop !15

60:                                               ; preds = %36, %60
  %61 = phi double [ %142, %60 ], [ 0.000000e+00, %36 ]
  %62 = phi i32 [ %143, %60 ], [ 0, %36 ]
  %63 = phi i32 [ %144, %60 ], [ 0, %36 ]
  %64 = add nsw i32 %62, %37
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds double, double addrspace(1)* %0, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !11
  %68 = zext i32 %62 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %1, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !11
  %71 = fmul contract double %67, %70
  %72 = fadd contract double %61, %71
  store double %72, double addrspace(1)* %35, align 8, !tbaa !11
  %73 = or i32 %62, 1
  %74 = add nsw i32 %73, %37
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !11
  %78 = zext i32 %73 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %1, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !11
  %81 = fmul contract double %77, %80
  %82 = fadd contract double %72, %81
  store double %82, double addrspace(1)* %35, align 8, !tbaa !11
  %83 = or i32 %62, 2
  %84 = add nsw i32 %83, %37
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %0, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !11
  %88 = zext i32 %83 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %1, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !11
  %91 = fmul contract double %87, %90
  %92 = fadd contract double %82, %91
  store double %92, double addrspace(1)* %35, align 8, !tbaa !11
  %93 = or i32 %62, 3
  %94 = add nsw i32 %93, %37
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %0, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !11
  %98 = zext i32 %93 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %1, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !11
  %101 = fmul contract double %97, %100
  %102 = fadd contract double %92, %101
  store double %102, double addrspace(1)* %35, align 8, !tbaa !11
  %103 = or i32 %62, 4
  %104 = add nsw i32 %103, %37
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds double, double addrspace(1)* %0, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !11
  %108 = zext i32 %103 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %1, i64 %108
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !11
  %111 = fmul contract double %107, %110
  %112 = fadd contract double %102, %111
  store double %112, double addrspace(1)* %35, align 8, !tbaa !11
  %113 = or i32 %62, 5
  %114 = add nsw i32 %113, %37
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double addrspace(1)* %0, i64 %115
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !11
  %118 = zext i32 %113 to i64
  %119 = getelementptr inbounds double, double addrspace(1)* %1, i64 %118
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !11
  %121 = fmul contract double %117, %120
  %122 = fadd contract double %112, %121
  store double %122, double addrspace(1)* %35, align 8, !tbaa !11
  %123 = or i32 %62, 6
  %124 = add nsw i32 %123, %37
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds double, double addrspace(1)* %0, i64 %125
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !11
  %128 = zext i32 %123 to i64
  %129 = getelementptr inbounds double, double addrspace(1)* %1, i64 %128
  %130 = load double, double addrspace(1)* %129, align 8, !tbaa !11
  %131 = fmul contract double %127, %130
  %132 = fadd contract double %122, %131
  store double %132, double addrspace(1)* %35, align 8, !tbaa !11
  %133 = or i32 %62, 7
  %134 = add nsw i32 %133, %37
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds double, double addrspace(1)* %0, i64 %135
  %137 = load double, double addrspace(1)* %136, align 8, !tbaa !11
  %138 = zext i32 %133 to i64
  %139 = getelementptr inbounds double, double addrspace(1)* %1, i64 %138
  %140 = load double, double addrspace(1)* %139, align 8, !tbaa !11
  %141 = fmul contract double %137, %140
  %142 = fadd contract double %132, %141
  store double %142, double addrspace(1)* %35, align 8, !tbaa !11
  %143 = add nuw nsw i32 %62, 8
  %144 = add i32 %63, 8
  %145 = icmp eq i32 %144, %30
  br i1 %145, label %38, label %60, !llvm.loop !17

146:                                              ; preds = %57, %18, %7
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
