; ModuleID = '../data/hip_kernels/13945/6/main.cu'
source_filename = "../data/hip_kernels/13945/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17transposeDiagonalPfS_iiE4tile = internal unnamed_addr addrspace(3) global [16 x [17 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17transposeDiagonalPfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp eq i32 %2, %3
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  br i1 %5, label %7, label %24

7:                                                ; preds = %4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = add i32 %6, %8
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !4
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = urem i32 %9, %22
  br label %60

24:                                               ; preds = %4
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 12
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 4, !tbaa !4
  %29 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 4, !range !13, !invariant.load !14
  %32 = zext i16 %31 to i32
  %33 = udiv i32 %28, %32
  %34 = mul i32 %33, %32
  %35 = icmp ugt i32 %28, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %39 = mul i32 %37, %38
  %40 = add i32 %39, %6
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 16
  %42 = bitcast i8 addrspace(4)* %41 to i32 addrspace(4)*
  %43 = load i32, i32 addrspace(4)* %42, align 8, !tbaa !15
  %44 = getelementptr i8, i8 addrspace(4)* %25, i64 6
  %45 = bitcast i8 addrspace(4)* %44 to i16 addrspace(4)*
  %46 = load i16, i16 addrspace(4)* %45, align 2, !range !13, !invariant.load !14
  %47 = zext i16 %46 to i32
  %48 = udiv i32 %43, %47
  %49 = mul i32 %48, %47
  %50 = icmp ugt i32 %43, %49
  %51 = zext i1 %50 to i32
  %52 = add i32 %48, %51
  %53 = freeze i32 %40
  %54 = freeze i32 %52
  %55 = udiv i32 %53, %54
  %56 = mul i32 %55, %54
  %57 = sub i32 %53, %56
  %58 = add i32 %55, %57
  %59 = urem i32 %58, %37
  br label %60

60:                                               ; preds = %24, %7
  %61 = phi i32 [ %6, %7 ], [ %57, %24 ]
  %62 = phi i32 [ %23, %7 ], [ %59, %24 ]
  %63 = shl nsw i32 %62, 4
  %64 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %65 = shl nsw i32 %61, 4
  %66 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %67 = add i32 %65, %66
  %68 = add i32 %63, %66
  %69 = add i32 %63, %64
  %70 = mul i32 %67, %2
  %71 = add i32 %69, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !17, !amdgpu.noclobber !14
  %75 = getelementptr inbounds [16 x [17 x float]], [16 x [17 x float]] addrspace(3)* @_ZZ17transposeDiagonalPfS_iiE4tile, i32 0, i32 %66, i32 %64
  store float %74, float addrspace(3)* %75, align 4, !tbaa !17
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = add i32 %65, %64
  %77 = getelementptr inbounds [16 x [17 x float]], [16 x [17 x float]] addrspace(3)* @_ZZ17transposeDiagonalPfS_iiE4tile, i32 0, i32 %64, i32 %66
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !17
  %79 = mul i32 %68, %3
  %80 = add i32 %76, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  store float %78, float addrspace(1)* %82, align 4, !tbaa !17
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
