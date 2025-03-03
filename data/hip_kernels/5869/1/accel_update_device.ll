; ModuleID = '../data/hip_kernels/5869/1/main.cu'
source_filename = "../data/hip_kernels/5869/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12accel_updateiiddPdS_(i32 %0, i32 %1, double %2, double %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
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
  %21 = mul nsw i32 %1, %0
  %22 = icmp slt i32 %15, %21
  br i1 %22, label %23, label %68

23:                                               ; preds = %6
  %24 = add nsw i32 %1, -1
  %25 = icmp slt i32 %18, %24
  %26 = icmp sgt i32 %18, 0
  %27 = and i1 %25, %26
  br i1 %27, label %28, label %62

28:                                               ; preds = %23
  %29 = add nsw i32 %0, -1
  %30 = icmp slt i32 %20, %29
  %31 = icmp sgt i32 %20, 0
  %32 = and i1 %30, %31
  br i1 %32, label %33, label %62

33:                                               ; preds = %28
  %34 = add nsw i32 %15, %0
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %4, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !7, !amdgpu.noclobber !5
  %38 = sub nsw i32 %15, %0
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %4, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !5
  %42 = fadd contract double %37, %41
  %43 = sext i32 %15 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %4, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7, !amdgpu.noclobber !5
  %46 = fmul contract double %45, 2.000000e+00
  %47 = fsub contract double %42, %46
  %48 = fmul contract double %47, %2
  %49 = add nsw i32 %15, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %4, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7, !amdgpu.noclobber !5
  %53 = add nsw i32 %15, -1
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %4, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7, !amdgpu.noclobber !5
  %57 = fadd contract double %52, %56
  %58 = fsub contract double %57, %46
  %59 = fmul contract double %58, %3
  %60 = fadd contract double %48, %59
  %61 = fmul contract double %60, 5.000000e-01
  br label %64

62:                                               ; preds = %28, %23
  %63 = sext i32 %15 to i64
  br label %64

64:                                               ; preds = %62, %33
  %65 = phi i64 [ %43, %33 ], [ %63, %62 ]
  %66 = phi double [ %61, %33 ], [ 0.000000e+00, %62 ]
  %67 = getelementptr inbounds double, double addrspace(1)* %5, i64 %65
  store double %66, double addrspace(1)* %67, align 8, !tbaa !7
  br label %68

68:                                               ; preds = %64, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
