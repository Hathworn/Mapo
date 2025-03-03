; ModuleID = '../data/hip_kernels/11506/3/main.cu'
source_filename = "../data/hip_kernels/11506/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14Matrix_ProductPdS_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 2, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp sgt i32 %12, 1000
  br i1 %13, label %125, label %14

14:                                               ; preds = %3
  %15 = mul nsw i32 %12, 1000
  br label %21

16:                                               ; preds = %21
  %17 = sext i32 %12 to i64
  %18 = getelementptr inbounds double, double addrspace(1)* %2, i64 %17
  %19 = load double, double addrspace(1)* %18, align 8, !tbaa !7, !amdgpu.noclobber !5
  %20 = fadd contract double %122, %19
  store double %20, double addrspace(1)* %18, align 8, !tbaa !7
  br label %125

21:                                               ; preds = %21, %14
  %22 = phi i32 [ 0, %14 ], [ %123, %21 ]
  %23 = phi double [ 0.000000e+00, %14 ], [ %122, %21 ]
  %24 = add nsw i32 %22, %15
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %0, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !7, !amdgpu.noclobber !5
  %28 = zext i32 %22 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %1, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !5
  %31 = fmul contract double %27, %30
  %32 = fadd contract double %23, %31
  %33 = or i32 %22, 1
  %34 = add nsw i32 %33, %15
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !7, !amdgpu.noclobber !5
  %38 = zext i32 %33 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %1, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7, !amdgpu.noclobber !5
  %41 = fmul contract double %37, %40
  %42 = fadd contract double %32, %41
  %43 = add nuw nsw i32 %22, 2
  %44 = add nsw i32 %43, %15
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %0, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !5
  %48 = zext i32 %43 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7, !amdgpu.noclobber !5
  %51 = fmul contract double %47, %50
  %52 = fadd contract double %42, %51
  %53 = add nuw nsw i32 %22, 3
  %54 = add nsw i32 %53, %15
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %0, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7, !amdgpu.noclobber !5
  %58 = zext i32 %53 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %1, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !7, !amdgpu.noclobber !5
  %61 = fmul contract double %57, %60
  %62 = fadd contract double %52, %61
  %63 = add nuw nsw i32 %22, 4
  %64 = add nsw i32 %63, %15
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds double, double addrspace(1)* %0, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !7, !amdgpu.noclobber !5
  %68 = zext i32 %63 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %1, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7, !amdgpu.noclobber !5
  %71 = fmul contract double %67, %70
  %72 = fadd contract double %62, %71
  %73 = add nuw nsw i32 %22, 5
  %74 = add nsw i32 %73, %15
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7, !amdgpu.noclobber !5
  %78 = zext i32 %73 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %1, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !7, !amdgpu.noclobber !5
  %81 = fmul contract double %77, %80
  %82 = fadd contract double %72, %81
  %83 = add nuw nsw i32 %22, 6
  %84 = add nsw i32 %83, %15
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %0, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !7, !amdgpu.noclobber !5
  %88 = zext i32 %83 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %1, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !7, !amdgpu.noclobber !5
  %91 = fmul contract double %87, %90
  %92 = fadd contract double %82, %91
  %93 = add nuw nsw i32 %22, 7
  %94 = add nsw i32 %93, %15
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %0, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7, !amdgpu.noclobber !5
  %98 = zext i32 %93 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %1, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !7, !amdgpu.noclobber !5
  %101 = fmul contract double %97, %100
  %102 = fadd contract double %92, %101
  %103 = add nuw nsw i32 %22, 8
  %104 = add nsw i32 %103, %15
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds double, double addrspace(1)* %0, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !7, !amdgpu.noclobber !5
  %108 = zext i32 %103 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %1, i64 %108
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !7, !amdgpu.noclobber !5
  %111 = fmul contract double %107, %110
  %112 = fadd contract double %102, %111
  %113 = add nuw nsw i32 %22, 9
  %114 = add nsw i32 %113, %15
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double addrspace(1)* %0, i64 %115
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !7, !amdgpu.noclobber !5
  %118 = zext i32 %113 to i64
  %119 = getelementptr inbounds double, double addrspace(1)* %1, i64 %118
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !7, !amdgpu.noclobber !5
  %121 = fmul contract double %117, %120
  %122 = fadd contract double %112, %121
  %123 = add nuw nsw i32 %22, 10
  %124 = icmp eq i32 %123, 1000
  br i1 %124, label %16, label %21, !llvm.loop !11

125:                                              ; preds = %3, %16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
