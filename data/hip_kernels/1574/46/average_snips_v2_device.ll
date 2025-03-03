; ModuleID = '../data/hip_kernels/1574/46/main.cu'
source_filename = "../data/hip_kernels/1574/46/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16average_snips_v2PKdPKiS2_S2_PKfS4_Pf(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readnone %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = icmp sgt i32 %9, 0
  br i1 %17, label %18, label %160

18:                                               ; preds = %7
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 7
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !4, !amdgpu.noclobber !8
  %21 = fptosi double %20 to i32
  %22 = icmp slt i32 %15, 1
  %23 = icmp sgt i32 %12, 0
  %24 = mul i32 %16, %21
  %25 = and i32 %12, 7
  %26 = icmp ult i32 %12, 8
  %27 = and i32 %12, -8
  %28 = icmp eq i32 %25, 0
  br label %29

29:                                               ; preds = %18, %157
  %30 = phi i32 [ 0, %18 ], [ %158, %157 ]
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !9, !amdgpu.noclobber !8
  %34 = icmp ne i32 %33, %16
  %35 = select i1 %34, i1 true, i1 %22
  br i1 %35, label %157, label %36

36:                                               ; preds = %29
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %31
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !9, !amdgpu.noclobber !8
  %39 = mul nsw i32 %38, %15
  %40 = mul i32 %30, %15
  br label %41

41:                                               ; preds = %36, %154
  %42 = phi i32 [ 0, %36 ], [ %155, %154 ]
  br i1 %23, label %43, label %154

43:                                               ; preds = %41
  %44 = add nsw i32 %42, %39
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !9, !amdgpu.noclobber !8
  %48 = add i32 %42, %40
  %49 = mul i32 %48, %12
  %50 = add i32 %47, %24
  %51 = mul i32 %50, %12
  br i1 %26, label %137, label %52

52:                                               ; preds = %43, %52
  %53 = phi i32 [ %134, %52 ], [ 0, %43 ]
  %54 = phi i32 [ %135, %52 ], [ 0, %43 ]
  %55 = add i32 %53, %49
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !11
  %59 = add i32 %53, %51
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %6, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !11
  %63 = fadd contract float %58, %62
  store float %63, float addrspace(1)* %61, align 4, !tbaa !11
  %64 = or i32 %53, 1
  %65 = add i32 %64, %49
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %4, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !11
  %69 = add i32 %64, %51
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %6, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !11
  %73 = fadd contract float %68, %72
  store float %73, float addrspace(1)* %71, align 4, !tbaa !11
  %74 = or i32 %53, 2
  %75 = add i32 %74, %49
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %4, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !11
  %79 = add i32 %74, %51
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %6, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11
  %83 = fadd contract float %78, %82
  store float %83, float addrspace(1)* %81, align 4, !tbaa !11
  %84 = or i32 %53, 3
  %85 = add i32 %84, %49
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %4, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !11
  %89 = add i32 %84, %51
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %6, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !11
  %93 = fadd contract float %88, %92
  store float %93, float addrspace(1)* %91, align 4, !tbaa !11
  %94 = or i32 %53, 4
  %95 = add i32 %94, %49
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %4, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !11
  %99 = add i32 %94, %51
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %6, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !11
  %103 = fadd contract float %98, %102
  store float %103, float addrspace(1)* %101, align 4, !tbaa !11
  %104 = or i32 %53, 5
  %105 = add i32 %104, %49
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %4, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !11
  %109 = add i32 %104, %51
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %6, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !11
  %113 = fadd contract float %108, %112
  store float %113, float addrspace(1)* %111, align 4, !tbaa !11
  %114 = or i32 %53, 6
  %115 = add i32 %114, %49
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %4, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !11
  %119 = add i32 %114, %51
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %6, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !11
  %123 = fadd contract float %118, %122
  store float %123, float addrspace(1)* %121, align 4, !tbaa !11
  %124 = or i32 %53, 7
  %125 = add i32 %124, %49
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %4, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !11
  %129 = add i32 %124, %51
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %6, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !11
  %133 = fadd contract float %128, %132
  store float %133, float addrspace(1)* %131, align 4, !tbaa !11
  %134 = add nuw nsw i32 %53, 8
  %135 = add i32 %54, 8
  %136 = icmp eq i32 %135, %27
  br i1 %136, label %137, label %52, !llvm.loop !13

137:                                              ; preds = %52, %43
  %138 = phi i32 [ 0, %43 ], [ %134, %52 ]
  br i1 %28, label %154, label %139

139:                                              ; preds = %137, %139
  %140 = phi i32 [ %151, %139 ], [ %138, %137 ]
  %141 = phi i32 [ %152, %139 ], [ 0, %137 ]
  %142 = add i32 %140, %49
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %4, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !11
  %146 = add i32 %140, %51
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %6, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !11
  %150 = fadd contract float %145, %149
  store float %150, float addrspace(1)* %148, align 4, !tbaa !11
  %151 = add nuw nsw i32 %140, 1
  %152 = add i32 %141, 1
  %153 = icmp eq i32 %152, %25
  br i1 %153, label %154, label %139, !llvm.loop !15

154:                                              ; preds = %137, %139, %41
  %155 = add nuw nsw i32 %42, 1
  %156 = icmp eq i32 %155, %15
  br i1 %156, label %157, label %41, !llvm.loop !17

157:                                              ; preds = %154, %29
  %158 = add nuw nsw i32 %30, 1
  %159 = icmp eq i32 %158, %9
  br i1 %159, label %160, label %29, !llvm.loop !18

160:                                              ; preds = %157, %7
  ret void
}

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
