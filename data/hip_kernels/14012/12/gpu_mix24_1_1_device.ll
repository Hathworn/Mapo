; ModuleID = '../data/hip_kernels/14012/12/main.cu'
source_filename = "../data/hip_kernels/14012/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13gpu_mix24_1_1PhjPiS0_iPtijiii(i8 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i16 addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = icmp slt i32 %20, %4
  br i1 %21, label %22, label %80

22:                                               ; preds = %11
  %23 = shl nsw i32 %20, 1
  %24 = mul nsw i32 %20, 3
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %25
  %27 = mul i32 %1, 3
  %28 = add i32 %27, -3
  %29 = mul i32 %20, %28
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %26, i64 %30
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !7, !amdgpu.noclobber !6
  %33 = zext i8 %32 to i32
  %34 = shl nuw nsw i32 %33, 16
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 1
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !7, !amdgpu.noclobber !6
  %37 = zext i8 %36 to i32
  %38 = shl nuw nsw i32 %37, 8
  %39 = or i32 %38, %34
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 2
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !7, !amdgpu.noclobber !6
  %42 = zext i8 %41 to i32
  %43 = or i32 %39, %42
  %44 = shl nuw i32 %43, 8
  %45 = ashr exact i32 %44, 8
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 3
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !7, !amdgpu.noclobber !6
  %48 = zext i8 %47 to i32
  %49 = shl nuw nsw i32 %48, 16
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %46, i64 1
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !7, !amdgpu.noclobber !6
  %52 = zext i8 %51 to i32
  %53 = shl nuw nsw i32 %52, 8
  %54 = or i32 %53, %49
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %46, i64 2
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !7, !amdgpu.noclobber !6
  %57 = zext i8 %56 to i32
  %58 = or i32 %54, %57
  %59 = shl nuw i32 %58, 8
  %60 = ashr exact i32 %59, 8
  %61 = and i32 %43, %7
  %62 = trunc i32 %61 to i16
  %63 = sext i32 %23 to i64
  %64 = getelementptr inbounds i16, i16 addrspace(1)* %5, i64 %63
  store i16 %62, i16 addrspace(1)* %64, align 2, !tbaa !10
  %65 = and i32 %58, %7
  %66 = trunc i32 %65 to i16
  %67 = add nuw nsw i32 %23, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i16, i16 addrspace(1)* %5, i64 %68
  store i16 %66, i16 addrspace(1)* %69, align 2, !tbaa !10
  %70 = ashr i32 %45, %10
  %71 = ashr i32 %60, %10
  %72 = mul nsw i32 %70, %6
  %73 = mul nsw i32 %71, %8
  %74 = add nsw i32 %73, %72
  %75 = ashr i32 %74, %9
  %76 = sext i32 %20 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %76
  store i32 %75, i32 addrspace(1)* %77, align 4, !tbaa !12
  %78 = sub nsw i32 %70, %71
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %76
  store i32 %78, i32 addrspace(1)* %79, align 4, !tbaa !12
  br label %80

80:                                               ; preds = %22, %11
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"short", !8, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !8, i64 0}
