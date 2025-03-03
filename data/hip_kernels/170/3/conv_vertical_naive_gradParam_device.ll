; ModuleID = '../data/hip_kernels/170/3/main.cu'
source_filename = "../data/hip_kernels/170/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29conv_vertical_naive_gradParamiPfPKfS1_iii(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %34

21:                                               ; preds = %7
  %22 = mul i32 %6, %5
  %23 = icmp sgt i32 %22, 0
  %24 = udiv i32 %16, %13
  %25 = mul i32 %24, %13
  %26 = icmp ugt i32 %16, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %13
  %30 = and i32 %22, 7
  %31 = icmp ult i32 %22, 8
  %32 = and i32 %22, -8
  %33 = icmp eq i32 %30, 0
  br label %35

34:                                               ; preds = %68, %7
  ret void

35:                                               ; preds = %21, %68
  %36 = phi i32 [ %19, %21 ], [ %69, %68 ]
  %37 = freeze i32 %36
  %38 = freeze i32 %4
  %39 = sdiv i32 %37, %38
  %40 = mul i32 %22, %39
  %41 = mul i32 %39, %38
  %42 = sub i32 %37, %41
  %43 = mul nsw i32 %42, %6
  br i1 %23, label %44, label %68

44:                                               ; preds = %35
  %45 = sext i32 %36 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  br i1 %31, label %48, label %71

48:                                               ; preds = %71, %44
  %49 = phi float [ %47, %44 ], [ %161, %71 ]
  %50 = phi i32 [ 0, %44 ], [ %162, %71 ]
  br i1 %33, label %68, label %51

51:                                               ; preds = %48, %51
  %52 = phi float [ %64, %51 ], [ %49, %48 ]
  %53 = phi i32 [ %65, %51 ], [ %50, %48 ]
  %54 = phi i32 [ %66, %51 ], [ 0, %48 ]
  %55 = add i32 %53, %40
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = add i32 %55, %43
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16
  %63 = fmul contract float %58, %62
  %64 = fadd contract float %52, %63
  store float %64, float addrspace(1)* %46, align 4, !tbaa !16
  %65 = add nuw nsw i32 %53, 1
  %66 = add i32 %54, 1
  %67 = icmp eq i32 %66, %30
  br i1 %67, label %68, label %51, !llvm.loop !20

68:                                               ; preds = %48, %51, %35
  %69 = add i32 %29, %36
  %70 = icmp slt i32 %69, %0
  br i1 %70, label %35, label %34, !llvm.loop !22

71:                                               ; preds = %44, %71
  %72 = phi float [ %161, %71 ], [ %47, %44 ]
  %73 = phi i32 [ %162, %71 ], [ 0, %44 ]
  %74 = phi i32 [ %163, %71 ], [ 0, %44 ]
  %75 = add i32 %73, %40
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %3, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = add i32 %75, %43
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = fmul contract float %78, %82
  %84 = fadd contract float %72, %83
  store float %84, float addrspace(1)* %46, align 4, !tbaa !16
  %85 = or i32 %73, 1
  %86 = add i32 %85, %40
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %3, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = add i32 %86, %43
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %2, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = fmul contract float %89, %93
  %95 = fadd contract float %84, %94
  store float %95, float addrspace(1)* %46, align 4, !tbaa !16
  %96 = or i32 %73, 2
  %97 = add i32 %96, %40
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %3, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = add i32 %97, %43
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = fmul contract float %100, %104
  %106 = fadd contract float %95, %105
  store float %106, float addrspace(1)* %46, align 4, !tbaa !16
  %107 = or i32 %73, 3
  %108 = add i32 %107, %40
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %3, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !16
  %112 = add i32 %108, %43
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %2, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16
  %116 = fmul contract float %111, %115
  %117 = fadd contract float %106, %116
  store float %117, float addrspace(1)* %46, align 4, !tbaa !16
  %118 = or i32 %73, 4
  %119 = add i32 %118, %40
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %3, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %123 = add i32 %119, %43
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %2, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16
  %127 = fmul contract float %122, %126
  %128 = fadd contract float %117, %127
  store float %128, float addrspace(1)* %46, align 4, !tbaa !16
  %129 = or i32 %73, 5
  %130 = add i32 %129, %40
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %3, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !16
  %134 = add i32 %130, %43
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %2, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !16
  %138 = fmul contract float %133, %137
  %139 = fadd contract float %128, %138
  store float %139, float addrspace(1)* %46, align 4, !tbaa !16
  %140 = or i32 %73, 6
  %141 = add i32 %140, %40
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %3, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !16
  %145 = add i32 %141, %43
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %2, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16
  %149 = fmul contract float %144, %148
  %150 = fadd contract float %139, %149
  store float %150, float addrspace(1)* %46, align 4, !tbaa !16
  %151 = or i32 %73, 7
  %152 = add i32 %151, %40
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %3, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !16
  %156 = add i32 %152, %43
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %2, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !16
  %160 = fmul contract float %155, %159
  %161 = fadd contract float %150, %160
  store float %161, float addrspace(1)* %46, align 4, !tbaa !16
  %162 = add nuw nsw i32 %73, 8
  %163 = add i32 %74, 8
  %164 = icmp eq i32 %163, %32
  br i1 %164, label %48, label %71, !llvm.loop !24
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
