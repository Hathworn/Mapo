; ModuleID = '../data/hip_kernels/636/2/main.cu'
source_filename = "../data/hip_kernels/636/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19map_index_to_prefixPhPjS0_S0_S0_jj(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp ult i32 %16, %6
  br i1 %17, label %18, label %89

18:                                               ; preds = %7
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = mul i32 %21, 30
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %23
  %25 = mul i32 %5, 3
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %24, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !11, !amdgpu.noclobber !5
  %29 = zext i8 %28 to i32
  %30 = shl nuw nsw i32 %29, 16
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 1
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !11, !amdgpu.noclobber !5
  %33 = zext i8 %32 to i32
  %34 = shl nuw nsw i32 %33, 8
  %35 = or i32 %34, %30
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 2
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !11, !amdgpu.noclobber !5
  %38 = zext i8 %37 to i32
  %39 = or i32 %35, %38
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %40
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = sub i32 %44, %42
  %46 = icmp ult i32 %45, %44
  br i1 %46, label %47, label %89

47:                                               ; preds = %18
  %48 = add i32 %42, -1
  %49 = and i32 %42, 7
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %59, label %51

51:                                               ; preds = %47, %51
  %52 = phi i32 [ %56, %51 ], [ %45, %47 ]
  %53 = phi i32 [ %57, %51 ], [ 0, %47 ]
  %54 = sext i32 %52 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %54
  store i32 %39, i32 addrspace(1)* %55, align 4, !tbaa !7
  %56 = add nuw nsw i32 %52, 1
  %57 = add i32 %53, 1
  %58 = icmp eq i32 %57, %49
  br i1 %58, label %59, label %51, !llvm.loop !12

59:                                               ; preds = %51, %47
  %60 = phi i32 [ %45, %47 ], [ %56, %51 ]
  %61 = icmp ult i32 %48, 7
  br i1 %61, label %89, label %62

62:                                               ; preds = %59, %62
  %63 = phi i32 [ %87, %62 ], [ %60, %59 ]
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %64
  store i32 %39, i32 addrspace(1)* %65, align 4, !tbaa !7
  %66 = add nuw nsw i32 %63, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %67
  store i32 %39, i32 addrspace(1)* %68, align 4, !tbaa !7
  %69 = add nuw nsw i32 %63, 2
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %70
  store i32 %39, i32 addrspace(1)* %71, align 4, !tbaa !7
  %72 = add nuw nsw i32 %63, 3
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %73
  store i32 %39, i32 addrspace(1)* %74, align 4, !tbaa !7
  %75 = add nuw nsw i32 %63, 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %76
  store i32 %39, i32 addrspace(1)* %77, align 4, !tbaa !7
  %78 = add nuw nsw i32 %63, 5
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %79
  store i32 %39, i32 addrspace(1)* %80, align 4, !tbaa !7
  %81 = add nuw nsw i32 %63, 6
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %82
  store i32 %39, i32 addrspace(1)* %83, align 4, !tbaa !7
  %84 = add nuw nsw i32 %63, 7
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %85
  store i32 %39, i32 addrspace(1)* %86, align 4, !tbaa !7
  %87 = add nuw nsw i32 %63, 8
  %88 = icmp eq i32 %87, %44
  br i1 %88, label %89, label %62, !llvm.loop !14

89:                                               ; preds = %59, %62, %18, %7
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
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
