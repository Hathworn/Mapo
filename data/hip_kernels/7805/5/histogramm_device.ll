; ModuleID = '../data/hip_kernels/7805/5/main.cu'
source_filename = "../data/hip_kernels/7805/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10histogrammPfPhiiiE13histo_private = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10histogrammPfPhiii(float addrspace(1)* nocapture %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %4
  %16 = mul i32 %15, %11
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = mul nsw i32 %3, %2
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %192

21:                                               ; preds = %5
  %22 = shl nuw nsw i32 %17, 3
  %23 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ10histogrammPfPhiiiE13histo_private, i32 0, i32 %22
  store i32 0, i32 addrspace(3)* %23, align 16, !tbaa !16
  %24 = add nuw nsw i32 %22, 1
  %25 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ10histogrammPfPhiiiE13histo_private, i32 0, i32 %24
  store i32 0, i32 addrspace(3)* %25, align 4, !tbaa !16
  %26 = add nuw nsw i32 %22, 2
  %27 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ10histogrammPfPhiiiE13histo_private, i32 0, i32 %26
  store i32 0, i32 addrspace(3)* %27, align 8, !tbaa !16
  %28 = add nuw nsw i32 %22, 3
  %29 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ10histogrammPfPhiiiE13histo_private, i32 0, i32 %28
  store i32 0, i32 addrspace(3)* %29, align 4, !tbaa !16
  %30 = add nuw nsw i32 %22, 4
  %31 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ10histogrammPfPhiiiE13histo_private, i32 0, i32 %30
  store i32 0, i32 addrspace(3)* %31, align 16, !tbaa !16
  %32 = add nuw nsw i32 %22, 5
  %33 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ10histogrammPfPhiiiE13histo_private, i32 0, i32 %32
  store i32 0, i32 addrspace(3)* %33, align 4, !tbaa !16
  %34 = add nuw nsw i32 %22, 6
  %35 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ10histogrammPfPhiiiE13histo_private, i32 0, i32 %34
  store i32 0, i32 addrspace(3)* %35, align 8, !tbaa !16
  %36 = add nuw nsw i32 %22, 7
  %37 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ10histogrammPfPhiiiE13histo_private, i32 0, i32 %36
  store i32 0, i32 addrspace(3)* %37, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp sgt i32 %4, 0
  br i1 %38, label %39, label %53

39:                                               ; preds = %21, %39
  %40 = phi i32 [ %48, %39 ], [ %18, %21 ]
  %41 = phi i32 [ %49, %39 ], [ 0, %21 ]
  %42 = sext i32 %40 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %42
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !20, !amdgpu.noclobber !5
  %45 = zext i8 %44 to i32
  %46 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ10histogrammPfPhiiiE13histo_private, i32 0, i32 %45
  %47 = atomicrmw add i32 addrspace(3)* %46, i32 1 syncscope("agent-one-as") monotonic, align 4
  %48 = add i32 %40, %11
  %49 = add nuw nsw i32 %41, 1
  %50 = icmp slt i32 %49, %4
  %51 = icmp slt i32 %48, %19
  %52 = select i1 %50, i1 %51, i1 false
  br i1 %52, label %39, label %53, !llvm.loop !21

53:                                               ; preds = %39, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = sitofp i32 %2 to float
  %55 = sitofp i32 %19 to float
  %56 = udiv i32 %14, %11
  %57 = mul i32 %56, %11
  %58 = icmp ugt i32 %14, %57
  %59 = zext i1 %58 to i32
  %60 = add i32 %56, %59
  %61 = uitofp i32 %60 to float
  %62 = fdiv contract float 0x3FDEB851E0000000, %61
  %63 = sitofp i32 %3 to float
  %64 = sitofp i32 %22 to float
  %65 = fadd contract float %64, -1.280000e+02
  %66 = fmul contract float %65, 3.906250e-03
  %67 = fmul contract float %66, %54
  %68 = mul nuw nsw i32 %17, 24
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  store float %67, float addrspace(1)* %70, align 4, !tbaa !23
  %71 = load i32, i32 addrspace(3)* %23, align 16, !tbaa !16
  %72 = uitofp i32 %71 to float
  %73 = fdiv contract float %72, %55
  %74 = fsub contract float %73, %62
  %75 = or i32 %68, 1
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = fmul contract float %74, %63
  %79 = atomicrmw fadd float addrspace(1)* %77, float %78 syncscope("agent-one-as") monotonic, align 4
  %80 = sitofp i32 %24 to float
  %81 = fadd contract float %80, -1.280000e+02
  %82 = fmul contract float %81, 3.906250e-03
  %83 = fmul contract float %82, %54
  %84 = mul nuw nsw i32 %24, 3
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  store float %83, float addrspace(1)* %86, align 4, !tbaa !23
  %87 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !16
  %88 = uitofp i32 %87 to float
  %89 = fdiv contract float %88, %55
  %90 = fsub contract float %89, %62
  %91 = add nuw nsw i32 %84, 1
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = fmul contract float %90, %63
  %95 = atomicrmw fadd float addrspace(1)* %93, float %94 syncscope("agent-one-as") monotonic, align 4
  %96 = sitofp i32 %26 to float
  %97 = fadd contract float %96, -1.280000e+02
  %98 = fmul contract float %97, 3.906250e-03
  %99 = fmul contract float %98, %54
  %100 = mul nuw nsw i32 %26, 3
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  store float %99, float addrspace(1)* %102, align 4, !tbaa !23
  %103 = load i32, i32 addrspace(3)* %27, align 8, !tbaa !16
  %104 = uitofp i32 %103 to float
  %105 = fdiv contract float %104, %55
  %106 = fsub contract float %105, %62
  %107 = or i32 %100, 1
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = fmul contract float %106, %63
  %111 = atomicrmw fadd float addrspace(1)* %109, float %110 syncscope("agent-one-as") monotonic, align 4
  %112 = sitofp i32 %28 to float
  %113 = fadd contract float %112, -1.280000e+02
  %114 = fmul contract float %113, 3.906250e-03
  %115 = fmul contract float %114, %54
  %116 = mul nuw nsw i32 %28, 3
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  store float %115, float addrspace(1)* %118, align 4, !tbaa !23
  %119 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !16
  %120 = uitofp i32 %119 to float
  %121 = fdiv contract float %120, %55
  %122 = fsub contract float %121, %62
  %123 = add nuw nsw i32 %116, 1
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = fmul contract float %122, %63
  %127 = atomicrmw fadd float addrspace(1)* %125, float %126 syncscope("agent-one-as") monotonic, align 4
  %128 = sitofp i32 %30 to float
  %129 = fadd contract float %128, -1.280000e+02
  %130 = fmul contract float %129, 3.906250e-03
  %131 = fmul contract float %130, %54
  %132 = mul nuw nsw i32 %30, 3
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  store float %131, float addrspace(1)* %134, align 4, !tbaa !23
  %135 = load i32, i32 addrspace(3)* %31, align 16, !tbaa !16
  %136 = uitofp i32 %135 to float
  %137 = fdiv contract float %136, %55
  %138 = fsub contract float %137, %62
  %139 = or i32 %132, 1
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = fmul contract float %138, %63
  %143 = atomicrmw fadd float addrspace(1)* %141, float %142 syncscope("agent-one-as") monotonic, align 4
  %144 = sitofp i32 %32 to float
  %145 = fadd contract float %144, -1.280000e+02
  %146 = fmul contract float %145, 3.906250e-03
  %147 = fmul contract float %146, %54
  %148 = mul nuw nsw i32 %32, 3
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  store float %147, float addrspace(1)* %150, align 4, !tbaa !23
  %151 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !16
  %152 = uitofp i32 %151 to float
  %153 = fdiv contract float %152, %55
  %154 = fsub contract float %153, %62
  %155 = add nuw nsw i32 %148, 1
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = fmul contract float %154, %63
  %159 = atomicrmw fadd float addrspace(1)* %157, float %158 syncscope("agent-one-as") monotonic, align 4
  %160 = sitofp i32 %34 to float
  %161 = fadd contract float %160, -1.280000e+02
  %162 = fmul contract float %161, 3.906250e-03
  %163 = fmul contract float %162, %54
  %164 = mul nuw nsw i32 %34, 3
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %165
  store float %163, float addrspace(1)* %166, align 4, !tbaa !23
  %167 = load i32, i32 addrspace(3)* %35, align 8, !tbaa !16
  %168 = uitofp i32 %167 to float
  %169 = fdiv contract float %168, %55
  %170 = fsub contract float %169, %62
  %171 = or i32 %164, 1
  %172 = zext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  %174 = fmul contract float %170, %63
  %175 = atomicrmw fadd float addrspace(1)* %173, float %174 syncscope("agent-one-as") monotonic, align 4
  %176 = sitofp i32 %36 to float
  %177 = fadd contract float %176, -1.280000e+02
  %178 = fmul contract float %177, 3.906250e-03
  %179 = fmul contract float %178, %54
  %180 = mul nuw nsw i32 %36, 3
  %181 = zext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %0, i64 %181
  store float %179, float addrspace(1)* %182, align 4, !tbaa !23
  %183 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !16
  %184 = uitofp i32 %183 to float
  %185 = fdiv contract float %184, %55
  %186 = fsub contract float %185, %62
  %187 = add nuw nsw i32 %180, 1
  %188 = zext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %0, i64 %188
  %190 = fmul contract float %186, %63
  %191 = atomicrmw fadd float addrspace(1)* %189, float %190 syncscope("agent-one-as") monotonic, align 4
  br label %192

192:                                              ; preds = %53, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!18, !18, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = !{!24, !24, i64 0}
!24 = !{!"float", !18, i64 0}
