; ModuleID = '../data/hip_kernels/9584/0/main.cu'
source_filename = "../data/hip_kernels/9584/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18bit_to_pauli_basisPdjj(double addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = shl nuw i32 1, %2
  %22 = icmp slt i32 %12, %21
  %23 = icmp slt i32 %20, %21
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %74

25:                                               ; preds = %3
  %26 = or i32 %12, %1
  %27 = shl i32 %26, %2
  %28 = xor i32 %1, -1
  %29 = and i32 %20, %28
  %30 = or i32 %27, %29
  %31 = shl i32 %30, 1
  %32 = and i32 %12, %28
  %33 = shl i32 %32, %2
  %34 = or i32 %20, %1
  %35 = or i32 %34, %33
  %36 = shl i32 %35, 1
  %37 = and i32 %12, %1
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %54, label %39

39:                                               ; preds = %25
  %40 = xor i32 %20, -1
  %41 = and i32 %40, %1
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %54, label %43

43:                                               ; preds = %39
  %44 = sext i32 %31 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !5
  %47 = sext i32 %36 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %0, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7, !amdgpu.noclobber !5
  %50 = fadd contract double %46, %49
  %51 = fmul contract double %50, 0x3FE6A09E667F3BCD
  store double %51, double addrspace(1)* %45, align 8, !tbaa !7
  %52 = fsub contract double %46, %49
  %53 = fmul contract double %52, 0x3FE6A09E667F3BCD
  store double %53, double addrspace(1)* %48, align 8, !tbaa !7
  br label %54

54:                                               ; preds = %43, %39, %25
  %55 = xor i32 %12, -1
  %56 = and i32 %55, %1
  %57 = icmp eq i32 %56, 0
  %58 = and i32 %20, %1
  %59 = icmp eq i32 %58, 0
  %60 = select i1 %57, i1 true, i1 %59
  br i1 %60, label %74, label %61

61:                                               ; preds = %54
  %62 = add nuw nsw i32 %31, 1
  %63 = add nuw nsw i32 %36, 1
  %64 = sext i32 %62 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %0, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7
  %67 = sext i32 %63 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7
  %70 = fadd contract double %66, %69
  %71 = fmul contract double %70, 0x3FE6A09E667F3BCD
  store double %71, double addrspace(1)* %65, align 8, !tbaa !7
  %72 = fsub contract double %66, %69
  %73 = fmul contract double %72, 0x3FE6A09E667F3BCD
  store double %73, double addrspace(1)* %68, align 8, !tbaa !7
  br label %74

74:                                               ; preds = %54, %61, %3
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
