; ModuleID = '../data/hip_kernels/175/4/main.cu'
source_filename = "../data/hip_kernels/175/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18mirrorImage_kerneljjjjjPiS_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp ult i32 %16, %3
  %26 = icmp ult i32 %24, %4
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %70

28:                                               ; preds = %7
  %29 = icmp ult i32 %16, %2
  br i1 %29, label %30, label %33

30:                                               ; preds = %28
  %31 = xor i32 %16, -1
  %32 = add i32 %31, %2
  br label %43

33:                                               ; preds = %28
  %34 = add i32 %2, %0
  %35 = icmp ult i32 %16, %34
  br i1 %35, label %36, label %38

36:                                               ; preds = %33
  %37 = sub i32 %16, %2
  br label %43

38:                                               ; preds = %33
  %39 = shl i32 %0, 1
  %40 = add i32 %39, -1
  %41 = add i32 %40, %2
  %42 = sub i32 %41, %16
  br label %43

43:                                               ; preds = %36, %38, %30
  %44 = phi i32 [ %32, %30 ], [ %37, %36 ], [ %42, %38 ]
  %45 = icmp ult i32 %24, %2
  br i1 %45, label %46, label %49

46:                                               ; preds = %43
  %47 = xor i32 %24, -1
  %48 = add i32 %47, %2
  br label %59

49:                                               ; preds = %43
  %50 = add i32 %2, %1
  %51 = icmp ult i32 %24, %50
  br i1 %51, label %52, label %54

52:                                               ; preds = %49
  %53 = sub i32 %24, %2
  br label %59

54:                                               ; preds = %49
  %55 = shl i32 %1, 1
  %56 = add i32 %2, -1
  %57 = add i32 %56, %55
  %58 = sub i32 %57, %24
  br label %59

59:                                               ; preds = %52, %54, %46
  %60 = phi i32 [ %48, %46 ], [ %53, %52 ], [ %58, %54 ]
  %61 = mul i32 %60, %0
  %62 = add i32 %61, %44
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = mul i32 %24, %3
  %67 = add i32 %66, %16
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %68
  store i32 %65, i32 addrspace(1)* %69, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %59, %7
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
