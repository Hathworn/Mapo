; ModuleID = '../data/hip_kernels/7511/3/main.cu'
source_filename = "../data/hip_kernels/7511/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24format_nlist_fill_b_se_aPiiiPKiS1_PyS1_iS_i(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readnone %3, i32 addrspace(1)* nocapture readnone %4, i64 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 %7, i32 addrspace(1)* nocapture %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp ult i32 %19, %2
  br i1 %20, label %21, label %131

21:                                               ; preds = %10
  %22 = mul i32 %19, %1
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  %25 = mul i32 %19, %7
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %26
  %28 = mul nsw i32 %9, %2
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i64, i64 addrspace(1)* %5, i64 %29
  %31 = mul i32 %19, %9
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i64, i64 addrspace(1)* %30, i64 %32
  %34 = icmp sgt i32 %7, 0
  br i1 %34, label %35, label %53

35:                                               ; preds = %21
  %36 = and i32 %7, 7
  %37 = icmp ult i32 %7, 8
  br i1 %37, label %40, label %38

38:                                               ; preds = %35
  %39 = and i32 %7, -8
  br label %60

40:                                               ; preds = %60, %35
  %41 = phi i32 [ 0, %35 ], [ %102, %60 ]
  %42 = icmp eq i32 %36, 0
  br i1 %42, label %53, label %43

43:                                               ; preds = %40, %43
  %44 = phi i32 [ %50, %43 ], [ %41, %40 ]
  %45 = phi i32 [ %51, %43 ], [ 0, %40 ]
  %46 = zext i32 %44 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %46
  store i32 %48, i32 addrspace(1)* %49, align 4, !tbaa !7
  %50 = add nuw nsw i32 %44, 1
  %51 = add i32 %45, 1
  %52 = icmp eq i32 %51, %36
  br i1 %52, label %53, label %43, !llvm.loop !11

53:                                               ; preds = %40, %43, %21
  %54 = add nsw i32 %9, -1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i64, i64 addrspace(1)* %33, i64 %55
  %57 = load i64, i64 addrspace(1)* %56, align 8, !tbaa !13, !amdgpu.noclobber !5
  %58 = load i64, i64 addrspace(1)* %33, align 8, !tbaa !13, !amdgpu.noclobber !5
  %59 = icmp eq i64 %58, %57
  br i1 %59, label %131, label %105

60:                                               ; preds = %60, %38
  %61 = phi i32 [ 0, %38 ], [ %102, %60 ]
  %62 = phi i32 [ 0, %38 ], [ %103, %60 ]
  %63 = zext i32 %61 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %63
  store i32 %65, i32 addrspace(1)* %66, align 4, !tbaa !7
  %67 = or i32 %61, 1
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %68
  store i32 %70, i32 addrspace(1)* %71, align 4, !tbaa !7
  %72 = or i32 %61, 2
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %73
  store i32 %75, i32 addrspace(1)* %76, align 4, !tbaa !7
  %77 = or i32 %61, 3
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !7
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %78
  store i32 %80, i32 addrspace(1)* %81, align 4, !tbaa !7
  %82 = or i32 %61, 4
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %83
  store i32 %85, i32 addrspace(1)* %86, align 4, !tbaa !7
  %87 = or i32 %61, 5
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %88
  store i32 %90, i32 addrspace(1)* %91, align 4, !tbaa !7
  %92 = or i32 %61, 6
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %93
  store i32 %95, i32 addrspace(1)* %96, align 4, !tbaa !7
  %97 = or i32 %61, 7
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %98
  store i32 %100, i32 addrspace(1)* %101, align 4, !tbaa !7
  %102 = add nuw nsw i32 %61, 8
  %103 = add i32 %62, 8
  %104 = icmp eq i32 %103, %39
  br i1 %104, label %40, label %60, !llvm.loop !15

105:                                              ; preds = %53, %125
  %106 = phi i64 [ %129, %125 ], [ %58, %53 ]
  %107 = phi i32 [ %126, %125 ], [ 0, %53 ]
  %108 = uitofp i64 %106 to double
  %109 = fdiv contract double %108, 1.000000e+15
  %110 = fptosi double %109 to i32
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7
  %114 = add nsw i32 %110, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !7
  %118 = icmp slt i32 %113, %117
  br i1 %118, label %119, label %125

119:                                              ; preds = %105
  %120 = urem i64 %106, 100000
  %121 = trunc i64 %120 to i32
  %122 = add nsw i32 %113, 1
  store i32 %122, i32 addrspace(1)* %112, align 4, !tbaa !7
  %123 = sext i32 %113 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %123
  store i32 %121, i32 addrspace(1)* %124, align 4, !tbaa !7
  br label %125

125:                                              ; preds = %119, %105
  %126 = add i32 %107, 1
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds i64, i64 addrspace(1)* %33, i64 %127
  %129 = load i64, i64 addrspace(1)* %128, align 8, !tbaa !13, !amdgpu.noclobber !5
  %130 = icmp eq i64 %129, %57
  br i1 %130, label %131, label %105, !llvm.loop !17

131:                                              ; preds = %125, %53, %10
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = !{!14, !14, i64 0}
!14 = !{!"long long", !9, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
