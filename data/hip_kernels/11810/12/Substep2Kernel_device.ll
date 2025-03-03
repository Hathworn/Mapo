; ModuleID = '../data/hip_kernels/11810/12/main.cu'
source_filename = "../data/hip_kernels/11810/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14Substep2KernelPdS_S_S_iiS_S_S_iS_dS_S_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, double addrspace(1)* nocapture readnone %6, double addrspace(1)* nocapture readnone %7, double addrspace(1)* nocapture writeonly %8, i32 %9, double addrspace(1)* nocapture readnone %10, double %11, double addrspace(1)* nocapture readnone %12, double addrspace(1)* nocapture readnone %13, double addrspace(1)* nocapture readnone %14, double addrspace(1)* nocapture readnone %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %17
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %28 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 2, !range !5, !invariant.load !6
  %31 = zext i16 %30 to i32
  %32 = mul i32 %27, %31
  %33 = add i32 %32, %26
  %34 = icmp slt i32 %33, %4
  %35 = icmp slt i32 %25, %5
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %79

37:                                               ; preds = %16
  %38 = add nsw i32 %33, 1
  %39 = mul nsw i32 %38, %5
  %40 = add nsw i32 %39, %25
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %1, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7, !amdgpu.noclobber !6
  %44 = mul nsw i32 %33, %5
  %45 = add nsw i32 %44, %25
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7, !amdgpu.noclobber !6
  %49 = fsub contract double %43, %48
  %50 = fcmp contract olt double %49, 0.000000e+00
  br i1 %50, label %51, label %57

51:                                               ; preds = %37
  %52 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7, !amdgpu.noclobber !6
  %54 = fmul contract double %53, 0x3FFFCF41F212D772
  %55 = fmul contract double %49, %54
  %56 = fmul contract double %49, %55
  br label %57

57:                                               ; preds = %37, %51
  %58 = phi double [ %56, %51 ], [ 0.000000e+00, %37 ]
  %59 = getelementptr inbounds double, double addrspace(1)* %8, i64 %46
  store double %58, double addrspace(1)* %59, align 8
  %60 = add nsw i32 %25, 1
  %61 = srem i32 %60, %5
  %62 = add nsw i32 %61, %44
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %2, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7
  %66 = getelementptr inbounds double, double addrspace(1)* %2, i64 %46
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !7
  %68 = fsub contract double %65, %67
  %69 = fcmp contract olt double %68, 0.000000e+00
  br i1 %69, label %70, label %76

70:                                               ; preds = %57
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7
  %73 = fmul contract double %72, 0x3FFFCF41F212D772
  %74 = fmul contract double %68, %73
  %75 = fmul contract double %68, %74
  br label %76

76:                                               ; preds = %57, %70
  %77 = phi double [ %75, %70 ], [ 0.000000e+00, %57 ]
  %78 = getelementptr inbounds double, double addrspace(1)* %3, i64 %46
  store double %77, double addrspace(1)* %78, align 8, !tbaa !7
  br label %79

79:                                               ; preds = %76, %16
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
