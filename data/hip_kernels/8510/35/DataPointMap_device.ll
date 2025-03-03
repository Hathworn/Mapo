; ModuleID = '../data/hip_kernels/8510/35/main.cu'
source_filename = "../data/hip_kernels/8510/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12DataPointMapPiPKdS1_PdS1_S_(i32 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readnone %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = zext i32 %7 to i64
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = zext i32 %9 to i64
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i64
  %16 = mul nuw nsw i64 %15, %10
  %17 = add nuw nsw i64 %16, %8
  %18 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = sext i32 %18 to i64
  %20 = icmp slt i64 %17, %19
  br i1 %20, label %21, label %109

21:                                               ; preds = %6
  %22 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = sext i32 %22 to i64
  %24 = mul nsw i64 %17, %23
  %25 = getelementptr inbounds double, double addrspace(1)* %1, i64 %24
  %26 = getelementptr inbounds double, double addrspace(1)* %3, i64 %24
  %27 = icmp sgt i32 %22, 0
  br i1 %27, label %28, label %109

28:                                               ; preds = %21
  %29 = and i64 %23, 7
  %30 = icmp ult i32 %22, 8
  br i1 %30, label %94, label %31

31:                                               ; preds = %28
  %32 = and i64 %23, -8
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi i64 [ 0, %31 ], [ %91, %33 ]
  %35 = phi i64 [ 0, %31 ], [ %92, %33 ]
  %36 = getelementptr inbounds double, double addrspace(1)* %25, i64 %34
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !11
  %38 = getelementptr inbounds double, double addrspace(1)* %4, i64 %34
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !11
  %40 = fadd contract double %37, %39
  %41 = getelementptr inbounds double, double addrspace(1)* %26, i64 %34
  store double %40, double addrspace(1)* %41, align 8, !tbaa !11
  %42 = or i64 %34, 1
  %43 = getelementptr inbounds double, double addrspace(1)* %25, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !11
  %45 = getelementptr inbounds double, double addrspace(1)* %4, i64 %42
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !11
  %47 = fadd contract double %44, %46
  %48 = getelementptr inbounds double, double addrspace(1)* %26, i64 %42
  store double %47, double addrspace(1)* %48, align 8, !tbaa !11
  %49 = or i64 %34, 2
  %50 = getelementptr inbounds double, double addrspace(1)* %25, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !11
  %52 = getelementptr inbounds double, double addrspace(1)* %4, i64 %49
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !11
  %54 = fadd contract double %51, %53
  %55 = getelementptr inbounds double, double addrspace(1)* %26, i64 %49
  store double %54, double addrspace(1)* %55, align 8, !tbaa !11
  %56 = or i64 %34, 3
  %57 = getelementptr inbounds double, double addrspace(1)* %25, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !11
  %59 = getelementptr inbounds double, double addrspace(1)* %4, i64 %56
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !11
  %61 = fadd contract double %58, %60
  %62 = getelementptr inbounds double, double addrspace(1)* %26, i64 %56
  store double %61, double addrspace(1)* %62, align 8, !tbaa !11
  %63 = or i64 %34, 4
  %64 = getelementptr inbounds double, double addrspace(1)* %25, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !11
  %66 = getelementptr inbounds double, double addrspace(1)* %4, i64 %63
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !11
  %68 = fadd contract double %65, %67
  %69 = getelementptr inbounds double, double addrspace(1)* %26, i64 %63
  store double %68, double addrspace(1)* %69, align 8, !tbaa !11
  %70 = or i64 %34, 5
  %71 = getelementptr inbounds double, double addrspace(1)* %25, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !11
  %73 = getelementptr inbounds double, double addrspace(1)* %4, i64 %70
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !11
  %75 = fadd contract double %72, %74
  %76 = getelementptr inbounds double, double addrspace(1)* %26, i64 %70
  store double %75, double addrspace(1)* %76, align 8, !tbaa !11
  %77 = or i64 %34, 6
  %78 = getelementptr inbounds double, double addrspace(1)* %25, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !11
  %80 = getelementptr inbounds double, double addrspace(1)* %4, i64 %77
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !11
  %82 = fadd contract double %79, %81
  %83 = getelementptr inbounds double, double addrspace(1)* %26, i64 %77
  store double %82, double addrspace(1)* %83, align 8, !tbaa !11
  %84 = or i64 %34, 7
  %85 = getelementptr inbounds double, double addrspace(1)* %25, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !11
  %87 = getelementptr inbounds double, double addrspace(1)* %4, i64 %84
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !11
  %89 = fadd contract double %86, %88
  %90 = getelementptr inbounds double, double addrspace(1)* %26, i64 %84
  store double %89, double addrspace(1)* %90, align 8, !tbaa !11
  %91 = add nuw nsw i64 %34, 8
  %92 = add nuw i64 %35, 8
  %93 = icmp eq i64 %92, %32
  br i1 %93, label %94, label %33, !llvm.loop !13

94:                                               ; preds = %33, %28
  %95 = phi i64 [ 0, %28 ], [ %91, %33 ]
  %96 = icmp eq i64 %29, 0
  br i1 %96, label %109, label %97

97:                                               ; preds = %94, %97
  %98 = phi i64 [ %106, %97 ], [ %95, %94 ]
  %99 = phi i64 [ %107, %97 ], [ 0, %94 ]
  %100 = getelementptr inbounds double, double addrspace(1)* %25, i64 %98
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !11
  %102 = getelementptr inbounds double, double addrspace(1)* %4, i64 %98
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !11
  %104 = fadd contract double %101, %103
  %105 = getelementptr inbounds double, double addrspace(1)* %26, i64 %98
  store double %104, double addrspace(1)* %105, align 8, !tbaa !11
  %106 = add nuw nsw i64 %98, 1
  %107 = add i64 %99, 1
  %108 = icmp eq i64 %107, %29
  br i1 %108, label %109, label %97, !llvm.loop !15

109:                                              ; preds = %94, %97, %21, %6
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
