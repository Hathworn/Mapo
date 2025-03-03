; ModuleID = '../data/hip_kernels/831/17/main.cu'
source_filename = "../data/hip_kernels/831/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@Global_Mask = protected addrspace(4) externally_initialized global [9 x i8] zeroinitializer, align 1
@_ZZ35convolution1d_tiles_constant_kernelPiS_E4Tile = internal unnamed_addr addrspace(3) global [34 x i32] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i32 0, i32 0) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z35convolution1d_tiles_constant_kernelPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = add i32 %3, -1
  %13 = mul i32 %12, %8
  %14 = add i32 %13, %10
  %15 = add nsw i32 %8, -1
  %16 = icmp ult i32 %10, %15
  br i1 %16, label %27, label %17

17:                                               ; preds = %2
  %18 = icmp slt i32 %14, 0
  br i1 %18, label %23, label %19

19:                                               ; preds = %17
  %20 = zext i32 %14 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %23

23:                                               ; preds = %17, %19
  %24 = phi i32 [ %22, %19 ], [ 0, %17 ]
  %25 = sub nsw i32 %10, %15
  %26 = getelementptr inbounds [34 x i32], [34 x i32] addrspace(3)* @_ZZ35convolution1d_tiles_constant_kernelPiS_E4Tile, i32 0, i32 %25
  store i32 %24, i32 addrspace(3)* %26, align 4, !tbaa !7
  br label %27

27:                                               ; preds = %23, %2
  %28 = icmp ult i32 %11, 32
  br i1 %28, label %29, label %33

29:                                               ; preds = %27
  %30 = zext i32 %11 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %33

33:                                               ; preds = %27, %29
  %34 = phi i32 [ %32, %29 ], [ 0, %27 ]
  %35 = add nuw nsw i32 %10, 1
  %36 = getelementptr inbounds [34 x i32], [34 x i32] addrspace(3)* @_ZZ35convolution1d_tiles_constant_kernelPiS_E4Tile, i32 0, i32 %35
  store i32 %34, i32 addrspace(3)* %36, align 4, !tbaa !7
  %37 = add i32 %3, 1
  %38 = mul i32 %37, %8
  %39 = add i32 %38, %10
  %40 = icmp eq i32 %10, 0
  br i1 %40, label %41, label %51

41:                                               ; preds = %33
  %42 = icmp sgt i32 %39, 31
  br i1 %42, label %47, label %43

43:                                               ; preds = %41
  %44 = sext i32 %39 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %47

47:                                               ; preds = %41, %43
  %48 = phi i32 [ %46, %43 ], [ 0, %41 ]
  %49 = add nuw nsw i32 %8, 1
  %50 = getelementptr inbounds [34 x i32], [34 x i32] addrspace(3)* @_ZZ35convolution1d_tiles_constant_kernelPiS_E4Tile, i32 0, i32 %49
  store i32 %48, i32 addrspace(3)* %50, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %47, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = getelementptr inbounds [34 x i32], [34 x i32] addrspace(3)* @_ZZ35convolution1d_tiles_constant_kernelPiS_E4Tile, i32 0, i32 %10
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !7
  %54 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 0), align 1, !tbaa !11
  %55 = sext i8 %54 to i32
  %56 = mul nsw i32 %53, %55
  %57 = add nuw nsw i32 %10, 1
  %58 = getelementptr inbounds [34 x i32], [34 x i32] addrspace(3)* @_ZZ35convolution1d_tiles_constant_kernelPiS_E4Tile, i32 0, i32 %57
  %59 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !7
  %60 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 1), align 1, !tbaa !11
  %61 = sext i8 %60 to i32
  %62 = mul nsw i32 %59, %61
  %63 = add nsw i32 %62, %56
  %64 = add nuw nsw i32 %10, 2
  %65 = getelementptr inbounds [34 x i32], [34 x i32] addrspace(3)* @_ZZ35convolution1d_tiles_constant_kernelPiS_E4Tile, i32 0, i32 %64
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !7
  %67 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 2), align 1, !tbaa !11
  %68 = sext i8 %67 to i32
  %69 = mul nsw i32 %66, %68
  %70 = add nsw i32 %69, %63
  %71 = zext i32 %11 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  store i32 %70, i32 addrspace(1)* %72, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
